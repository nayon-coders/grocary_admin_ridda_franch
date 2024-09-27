import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/app.config.dart';
import 'package:minia_web_project/controller/firebase.image.controller.dart';
import 'package:minia_web_project/data/model/product.list.model.dart';
import 'package:minia_web_project/data/service/api.service.dart';

class ProductController extends GetxController{

  RxString test = "Yes its binding".obs;

  Rx<TextEditingController> productName = TextEditingController().obs;
  Rx<TextEditingController> productShortDes = TextEditingController().obs;
  Rx<TextEditingController> productDes = TextEditingController().obs;
  Rx<TextEditingController> productUnit = TextEditingController().obs;
  Rx<String> productType = "".obs;
  Rx<TextEditingController> productStock = TextEditingController().obs;
  Rx<TextEditingController> productOrigin = TextEditingController().obs;
  Rx<TextEditingController> productTex = TextEditingController().obs;
  Rx<TextEditingController> productPurchasePrice = TextEditingController().obs;
  Rx<TextEditingController> restaurantPrice = TextEditingController().obs;
  Rx<TextEditingController> resellerPrice = TextEditingController().obs;
  Rx<TextEditingController> wholesalersPrice = TextEditingController().obs;
  Rx<TextEditingController> productDiscountPrice = TextEditingController().obs;
  RxString mainCatId = "".obs;
  Rx<List<dynamic>> subCatListId = Rx<List<dynamic>>([]);
  Rx<List<dynamic>> subCatListName = Rx<List<dynamic>>([]);
  RxString country = "".obs;
  RxString tax = "".obs;


  Rx<ProductListModel> productListModel = ProductListModel().obs;
  RxList<SingleProducts> productList = <SingleProducts>[].obs;



  RxBool isAddingLoading = false.obs;
  RxBool isGettingData = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //get all product
  getAllProduct()async{
    isGettingData.value = true;
    var res = await ApiService().getApi(AppConfig.PRODUCT_GET);
    if(res.statusCode == 200){
      productListModel.value = ProductListModel.fromJson(jsonDecode(res.body));
      for(var i in productListModel.value.data!){
        productList.value.add(i);
      }
    }
    isGettingData.value = false;

  }


  //add product
  addProduct(images)async{
    isAddingLoading.value = true;

    //upload image into firebase
    List convertedImage = [];
    for(var i=0; i<images.length; i++){
      convertedImage.add(await FirebaseImageController.uploadImageToFirebaseStorage(images[i], "product_images"));
    }


    var data = {
      "category_id": mainCatId.value,
      "name": productName.value.text,
      "product_type": productType.value,
      "unit": productUnit.value.text,
      "long_description": productDes.value.text,
      "short_description": productShortDes.value.text,
      "tax": tax.value,
      "country": country.value,
      "purchase_price": productPurchasePrice.value.text,
      "regular_price": restaurantPrice.value.text,
      "selling_price": resellerPrice.value.text,
      "whole_price": wholesalersPrice.value.text,
      "discount_price": productDiscountPrice.value.text,
      "images": convertedImage,
      "subcategories": subCatListId.value,
    };
    var res = await ApiService().postApi(AppConfig.PRODUCT_ADD, data);
    if(res.statusCode == 200){
      Get.snackbar("Success!", "Product added success", backgroundColor: Colors.green);
    }else{
      Get.snackbar("Error!", "Something went wrong. Status Code: ${res.statusCode}", backgroundColor: Colors.red);
    }
    isAddingLoading.value = false;
  }


  //







}