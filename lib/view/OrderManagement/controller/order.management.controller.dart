import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/data/service/api.service.dart';

import '../../../app.config.dart';
import '../../../data/model/all_order_model.dart';
import '../../../data/model/single_order_model.dart';

class OrderManagementController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllOrder();
  }

  //order status wise list
  RxList totalPendingOrder = [].obs;
  RxList totalProcessingOrder = [].obs;
  RxList totalDeliveredOrder = [].obs;
  RxList totalDispastOrder = [].obs;
  RxList totalCancelOrder = [].obs;
  RxList totalReturnOrder = [].obs;
  RxList totalshippedr = [].obs;
  RxList totalOrder = [].obs;
  RxList totalLivraisonOrder = [].obs;
  RxList totalRegulOrder = [].obs;
  RxList totalCompleteOrder = [].obs;

  //models
  Rx<SingleOrderModel> singleOrderModel = SingleOrderModel().obs;
  Rx<AllOrderModel> allOrderModel = AllOrderModel().obs;

  //string
  var orderStatus = "".obs;

  //bools
  var isGettingData = false.obs;
  var isGettingSingleOrder = false.obs;
  var isUpdatingOrderStatus = false.obs;
  //list of bool
  var isSelectedProduct = [].obs;

  //list of text editing controller
  var textEditingController = [].obs;


  //
  var totalNetIncome = 0.0.obs;
  var upcommingIncom = 0.0.obs;
  var pendingIncom  = 0.0.obs;
  var cancelIncom = 0.0.obs;




  getAllOrder()async{
    isGettingData.value = true;
    //all list clear
    totalPendingOrder.clear();
    totalProcessingOrder.clear();
    totalDeliveredOrder.clear();
    totalCancelOrder.clear();
    totalReturnOrder.clear();
    totalshippedr.clear();
    totalOrder.clear();
    totalLivraisonOrder.clear();
    totalRegulOrder.clear();
    totalCompleteOrder.clear();



    var response = await ApiService().getApi(AppConfig.ORDER_GET);
    if(response.statusCode == 200){
      allOrderModel.value = allOrderModelFromJson(response.body);
      for(var i in allOrderModel.value.data!){
        totalOrder.add(i);
        if(i.orderStatus == "Reçue en Attente"){
          totalPendingOrder.add(i);
        }else if(i.orderStatus == "En Préparation"){
          totalProcessingOrder.add(i);
        }else if(i.orderStatus == "Prête pour Dispatch"){
          //total pending income
          pendingIncom.value += i.total!;
          totalDispastOrder.add(i);
        }else if(i.orderStatus == "Livré"){
          totalDeliveredOrder.add(i);
        }else if(i.orderStatus == "return"){
          totalReturnOrder.add(i);
        }else if(i.orderStatus== "shipped"){
          totalshippedr.add(i);
        }else if(i.orderStatus == "En cours de Livraison"){
          //total upcomming income
          upcommingIncom.value += i.total!;
          totalLivraisonOrder.add(i);
        }else if(i.orderStatus == "À régler"){
          totalRegulOrder.add(i);
        }else if(i.orderStatus == "Annulé"){
          totalCancelOrder.add(i);
        }else if(i.orderStatus == "Terminé"){
          // calulate total net income
          totalNetIncome.value += i.total!;
          totalCompleteOrder.add(i);
        }
      }

    }
    isGettingData.value = false;
  }


  //get single order

  getSingleOrder(String id)async{
    isGettingSingleOrder.value = true;
    var response = await ApiService().getApi(AppConfig.ORDER_GET_SINGLE+id);
    if(response.statusCode == 200){
      singleOrderModel.value = singleOrderModelFromJson(response.body);
      for(var i in singleOrderModel.value.order!.products!){
        isSelectedProduct.add(false);
        textEditingController.add(TextEditingController());
      }
    }
    isGettingSingleOrder.value = false;
  }

  void updateOrderStatus(int? id, String value) async{
    isUpdatingOrderStatus.value = true;
    var response = await ApiService().putApi(AppConfig.ORDER_STATUS_UPDATE+id.toString(), {"order_status": value});
    if(response.statusCode == 200){
      getAllOrder();
      getSingleOrder(id.toString());
      Get.snackbar("Success!", "Order status updated successfully", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    }
    isUpdatingOrderStatus.value = false;
  }

  //order product price update
  void updateOrderProductPrice(int? id, int index) async{
    isUpdatingOrderStatus.value = true;

    List<Map<String, dynamic>> products = [];

    for(int i = 0; i < singleOrderModel.value.order!.products!.length; i++){

      if(i == index){
        products.add({
          "product_id": singleOrderModel.value.order!.products![i]!.productId!.toString(),
          "price": double.parse(textEditingController[i].text).toString(),
          "quantity": singleOrderModel.value.order!.products![i].quantity.toString()
        });
      }else{
        products.add({
          "product_id": singleOrderModel.value.order!.products![i].productId!.toString(),
          "price": singleOrderModel.value.order!.products![i].price.toString(),
          "quantity": singleOrderModel.value.order!.products![i].quantity.toString()
        });
      }
    }

    //make sub total and total from new products list
    var subTotal, total, deliveryFee;
    subTotal = products.fold(0.0, (previousValue, element) {
      return previousValue +
          double.parse(element["price"].toString()) *
              double.parse(element["quantity"].toString());
    });
    deliveryFee = double.parse(subTotal.toString()) > 60 ? 15.00 : 0.00;

    total = subTotal + singleOrderModel.value.order!.taxAmount! + deliveryFee;

    var data = {
      "sub_total": subTotal.toString(),
      "tax": singleOrderModel.value.order!.taxAmount!.toStringAsFixed(2),
      "tax_amount": singleOrderModel.value.order!.taxAmount!.toStringAsFixed(2),
      "delivery_fee": deliveryFee!.toStringAsFixed(2),
      "total": total!.toStringAsFixed(2),
      "products": products
    };
    print("data: $data");
    var response = await ApiService().putApi(AppConfig.ORDER_PRICE_UPDATE+id.toString(), data);
    if(response.statusCode == 200){
      getAllOrder();
      getSingleOrder(id.toString());
      Get.snackbar("Success!", "Order status updated successfully", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    }
    isUpdatingOrderStatus.value = false;
  }



}