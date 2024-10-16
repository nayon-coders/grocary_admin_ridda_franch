

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/app_button.dart';
import 'package:minia_web_project/comman/app_network_image.dart';
import 'package:minia_web_project/comman/colors.dart';
import 'package:minia_web_project/comman/dropdown2.dart';
import 'package:minia_web_project/controller/firebase.image.controller.dart';
import 'package:minia_web_project/controller/product_json.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/data/model/product.list.model.dart';
import 'package:minia_web_project/view/ProductManagement/controller/category.controller.dart';
import 'package:minia_web_project/view/ProductManagement/controller/product.controller.dart';

import '../../../data/model/main.category.model.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {

  SideBarController _sidebarController = Get.find<SideBarController>();
  CategoryController _categoryController = Get.find<CategoryController>();
  ProductController _productController = Get.find<ProductController>();

  ///DropdownButton


  List images = [];
  //store image
  uploadImage(file){
    setState(() {
      images.add(file);
    });
  }


  String? _description;
  String? _subCaregory;
  String? _tva;
  String? _countries;
  String? _productType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryController.getMainCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //title Text
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      _sidebarController.index.value = 1;
                      _productController.clearAll();
                    },
                    icon: Icon(Icons.arrow_back, size: 25,),
                  ),
                  Obx(() {
                      return Text(
                        _productController.isEdit.value ? "Edit Product" : "Add New Product",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      );
                    }
                  ),
                ],
              ),


              const SizedBox(height: 20,),


              SizedBox(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                    //left side
                    Expanded(
                      child: Container(
                        padding:const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            const Text("Caractéristiques",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                            ),

                            const SizedBox(height: 20,),

                            const Text("Fiche Produit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5,),
                            AppInput(controller: _productController.productName.value, hint: "Nom du Produit"),



                            const SizedBox(
                              height: 10,
                            ),


                            const Text(
                              "Conditionnement",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5,),

                            //short description Dropdown
                            DropDown2(

                                items: ProductJson.descriptionList,
                                value:  _productController.productShortDes.value.text.isNotEmpty ?  _productController.productShortDes.value.text : null,
                                hint: "Conditionnement", onChange: (v){setState(() {
                              _productController.productShortDes.value.text = v!;
                            });}),


                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Descriptif Produit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5,),
                            AppInput(
                              hint: "Une description longue de votre produit (min 200 caractères)",
                              controller: _productController.productDes.value,
                              maxLine: 6,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //unit field
                           const Text("Poids en Kg, Contenance en L ou Unité",
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5,),
                            AppInput(hint: "Unit", controller: _productController.productUnit.value, textType: TextInputType.number),
                            const SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 85,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Unité du Produit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DropDown2(
                                          items: ProductJson.productTypeList,
                                          hint: "Choisir",
                                         value: _productController.productType.value.isNotEmpty ?  _productController.productType.value :  null,
                                          onChange: (v){
                                            setState(() {
                                              _productController.productType.value = v!.toString();
                                            });
                                          }),

                                    ],
                                  )),

                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "En stock",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      AppInput(hint: "1000", controller: _productController.productStock.value),

                                    ],
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              height: 85,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Origine",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      //Country List

                                      DropDown2(
                                          items: ProductJson.allCountry,
                                          hint: "Origin",
                                         value: _productController.country.value.isNotEmpty ?  _productController.country.value :  null,
                                          onChange: (v){
                                            setState(() {
                                              _productController.country.value = v!.toString();
                                            });
                                          }),
                                    ],
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),


                                      const Text(
                                        "TVA %",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DropDown2(
                                          items: ProductJson.tvas, 
                                          hint:" 0.0 %",
                                          //value:  _productController.tax.value ?? "",
                                          onChange: (v){
                                            _productController.tax.value = v!; 
                                          }
                                          ),

                                    ],
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "Images products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5,),
                            Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade200)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await FirebaseImageController.startWebFilePicker(uploadImage);
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        margin:const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: Colors.green)),
                                        child: const Center(
                                          child: Icon(
                                            Icons.upload_outlined,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),

                                    images.isNotEmpty
                                        ? Expanded(
                                         child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: images.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (_, index) {
                                            var data = images[index];
                                            return Stack(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  margin:
                                                  const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.green)),
                                                  child: Image.memory(data!, fit: BoxFit.cover,),
                                                ),
                                                Positioned(
                                                  right: 15,
                                                  top: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            images.removeAt(index);
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                        )),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                    ) : _productController.productImages.value.isNotEmpty
                                        ?  SizedBox(
                                          height: 100,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: _productController.productImages.value.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (_, index) {
                                              var data = _productController.productImages.value[index];
                                              return Stack(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 100,
                                                    margin:
                                                    const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Colors.green)),
                                                    child: AppNetworkImage(image: data),
                                                  ),
                                                  Positioned(
                                                    right: 15,
                                                    top: 15,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _productController.productImages.value.removeAt(index);
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ) : Center()
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),


                    const SizedBox(width: 20,),

                    //Right Side
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //pricing part
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10)),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                 const Text("Prix",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),


                                 const SizedBox(height: 20,),
                                  SizedBox(
                                    width: 230,
                                    height: 75,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                       const Text(
                                          "Prix d'achat ht",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),

                                        AppInput(
                                            textType: TextInputType.number,
                                            hint: "Prix d'achat ht",
                                            controller: _productController.productPurchasePrice.value,
                                            onChanged: (v){
                                              _productController.restaurantPrice.value.text = ((double.parse(v) / 100) * 42 + double.parse(v)).toStringAsFixed(2);
                                              _productController.resellerPrice.value.text = ((double.parse(v) / 100) * 25 + double.parse(v)).toStringAsFixed(2);
                                              _productController.wholesalersPrice.value.text = ((double.parse(v) / 100) * 15 + double.parse(v)).toStringAsFixed(2);
                                            },
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                          const  Text(
                                              "Prix Revendeurs (+25%)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                           const SizedBox(height: 5,),
                                            AppInput( hint: "Prix Revendeurs", controller: _productController.resellerPrice.value,readOnly: true,)

                                          ],
                                        ),
                                      ),
                                    const  SizedBox(width: 10,),

                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                          const  Text(
                                              "Prix Restaurants (+42%)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                           const SizedBox(
                                              height: 5,
                                            ),
                                            AppInput(hint: "Prix Restaurants", controller: _productController.restaurantPrice.value,readOnly: true,),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                 const SizedBox(height: 10,),



                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                           const Text(
                                              "Prix Grossistes (+15%)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                           const SizedBox(
                                              height: 5,
                                            ),
                                            AppInput(hint: "Prix Grossistes", controller: _productController.wholesalersPrice.value,readOnly: true,),

                                          ],
                                        ),
                                      ),

                                     const SizedBox(width: 10),

                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                           const Text(
                                              "Remise en %",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            AppInput(controller: _productController.productDiscountPrice.value, hint: "Remise en %"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text(
                                      "Choisir une ou Plusieurs Catégories",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),

                                  const SizedBox(height: 20,),
                                  Obx(() {
                                    return _categoryController.isLoading.value
                                        ? Center()
                                        : DropdownButtonHideUnderline(
                                      child: DropdownButton2<SingleCategory>(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Main Category',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: _categoryController.mainCategoryModel.value.data!.map((item) {
                                          return DropdownMenuItem<SingleCategory>(
                                            value: item,
                                            child: Text(
                                              item.name!,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        value: _categoryController.mainCategoryModel.value.data!
                                            .contains(_categoryController.singleMainCategory.value)
                                            ? _categoryController.singleMainCategory.value
                                            : null, // Ensure valid value
                                        onChanged: (value) {
                                          if (value != null) {
                                            _categoryController.singleMainCategory.value = value;
                                            _categoryController.subCatList.value = value.subCategories!;
                                            _productController.mainCatId.value = value.id.toString();
                                          }
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Colors.grey.shade300),
                                          ),
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20,),
                                  // Dropdown for selecting subcategory
                                  Obx(() {
                                    return _categoryController.singleSubCat.value == null
                                        ? Center()
                                        : DropdownButtonHideUnderline(
                                      child: DropdownButton2<SingleCategory>(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Main Sub Category',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: _categoryController
                                            .singleMainCategory.value.subCategories!
                                            .map((item) {
                                          return DropdownMenuItem<SingleCategory>(
                                            value: item,
                                            child: Text(
                                              item.name!,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        value: _categoryController.singleMainCategory.value.subCategories!
                                            .contains(_categoryController.singleSubCat.value)
                                            ? _categoryController.singleSubCat.value
                                            : null, // Ensure valid value
                                        onChanged: (value) {
                                          if (value != null) {
                                            _categoryController.singleSubCat.value = value;

                                            // Add subcategory to productController's list and trigger reactivity
                                            if(_productController.subCatListId.value.contains(value.id.toString()) == false){
                                              _productController.subCatListId.value.add(value.id.toString());
                                              _productController.subCatListId.refresh(); // Notify change

                                              _productController.subCatListName.value.add(value.name.toString());
                                              _productController.subCatListName.refresh(); // Notify change
                                            }


                                          }
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Colors.grey.shade300),
                                          ),
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    );
                                  }),
                                  SizedBox(height: 10),

                                  // ListView displaying selected subcategories
                                  Obx(() {
                                    return _productController.subCatListName.value.isEmpty
                                        ? Center()
                                        : ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _productController.subCatListName.value.length,
                                      itemBuilder: (_, index) {
                                        return ListTile(
                                          title: Text("${_productController.subCatListName.value[index]}"),
                                          trailing: IconButton(
                                            onPressed: () {
                                              // Remove item from both lists and refresh
                                              _productController.subCatListName.value.removeAt(index);
                                              _productController.subCatListName.refresh(); // Refresh the name list


                                              _productController.subCatListId.value.removeAt(index);
                                              _productController.subCatListId.refresh(); // Refresh the ID list
                                            },
                                            icon: Icon(Icons.delete, color: Colors.red),
                                          ),
                                        );
                                      },
                                    );
                                  }),





                                  const SizedBox(height: 10,),

                                  // ListView.builder(
                                  //   physics:const NeverScrollableScrollPhysics(),
                                  //   shrinkWrap: true,
                                  //   itemCount: 1,
                                  //   itemBuilder: (_, index) {
                                  //     return Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Text(""),
                                  //           Icon(
                                  //             Icons.delete,
                                  //             color: Colors.red,
                                  //           )
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    )
                  ],
                  ),
              ),

             //add Product button
             const SizedBox(height: 30,),

              Obx(() {
                  return AppButton(
                    bgColor:   _productController.isEdit.value  ? Colors.amber : Colors.green,
                    isLoading: _productController.isAddingLoading.value,
                      onClick: ()async{
                      if(   _productController.isEdit.value  ){
                        await _productController.updateProduct(images, _productController.selectedSingleProductListModel.value.id.toString());
                      }else{
                        await _productController.addProduct(images);
                      }

                     },
                      text: "${   _productController.isEdit.value  ? "Edit Product" : "Add Product"} ");
                }
              ),

            ],

        ),
      ),
    );
  }

  selectCategoryMethod(){
    return showDialog(
        barrierDismissible: true,

        context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.zero,
        title: const Text("Select Category",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 15),),
        content: Container(
          height:500,
          width: 300,
          child: _categoryController.isLoading.value ? Center(child: CircularProgressIndicator(),) : ListView.builder(
              itemCount: _categoryController.mainCategoryModel.value.data!.length,
              itemBuilder: (context,index){
                var data = _categoryController.mainCategoryModel.value.data![index];
               return Container(
                  margin:const  EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColor.borders)
                  ),
                  child: ListTile(
                    onTap: (){},
                    contentPadding: const EdgeInsets.only(left: 10),
                    title: Text("${data.name}"),
                    leading: Image.network("${data.image}", height: 30, width: 30,),
                  ),
                );
              }),
        ),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context), child:const Text("Cancel"))
        ],

      );
    });
  }




}





