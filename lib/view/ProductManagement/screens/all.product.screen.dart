import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minia_web_project/comman/app_table/app.table.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/view/ProductManagement/controller/product.controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../comman/app_table/table.header.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  ProductController _productController = Get.find();
  SideBarController _sideBarController = Get.find();

  final _searchController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productController.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey.shade50,
      padding:const EdgeInsets.all(20),
      child: Container(
        child: AppTable(
          title: "Product List",
          headersChildren:const [
            TableHeader(name: "ID", width: 50),
            TableHeader(name: "Name", width: 200),
            TableHeader(name: "Stock", width: 80),
            TableHeader(name: "Purchase Price", width: 80),
            TableHeader(name: "Retailer Price", width: 80),
            TableHeader(name: "Whole Sell", width: 90),
            TableHeader(name: "Seller Price", width: 90),
            TableHeader(name: "Status", width: 80),
            TableHeader(name: "Date", width: 90),
            TableHeader(name: "Action", width: 140),
          ],
          row:  Obx(() {
            if(_productController.isGettingData.value){
              return Center(child: CircularProgressIndicator());
            }else{
              if(_productController.productListModel.value.data!.isEmpty ){
                return Center(child: Text("No product found!"),);
              }else {
                //if data
                if(_productController.searchResults.isNotEmpty){
                  return Obx((){
                      return Container(
                          height: 500,
                          child: ListView.builder(
                          //data length
                          itemCount: _productController.searchResults!.length,
                          itemBuilder: (context, index){


                        var data = _productController.searchResults![index];

                        //store data variable
                        return Container(
                          height: 56,
                          margin:const EdgeInsets.only(bottom:5,top: 5),
                          padding:const EdgeInsets.only(left: 15, right: 15,bottom: 5,top: 5),
                          decoration: BoxDecoration(
                            color:Colors.grey.shade200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [



                              //Id
                              TableHeader(name:"${index+1}", width: 50),


                              //Name
                              TableHeader(name: "${data.name}", width: 200),



                              //Stock
                              TableHeader(name: "${data.isStock}", width: 80),


                              //Purchase Price
                              TableHeader(name: "${data.purchasePrice}", width: 80),



                              //Retailer Price
                              TableHeader(name: "${data.regularPrice}", width: 80),




                              //Whole Sell
                              TableHeader(name: "${data.wholePrice}", width: 90),



                              //Seller Price
                              TableHeader(name: "${data.sellingPrice}", width: 90),

                              //Status
                              TableHeader(name: "Active", width: 80),


                              //DateTime
                              TableHeader(name: "${DateFormat("dd/mm/yyyy").format(DateTime.now())}", width: 90),


                              //Action button
                              SizedBox(
                                width: 140,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            _sideBarController.index.value = 2;
                                            _productController.selectedSingleProductListModel.value = data;
                                            _productController.updateProductValue();

                                          },
                                          icon:const Icon(Icons.edit,color: Colors.amber,)
                                      ),
                                      Obx(() {
                                        return IconButton(
                                            onPressed: (){
                                              _sideBarController.index.value = 2;
                                              _productController.selectedSingleProductListModel.value = data;
                                              _productController.updateProductValue();
                                            },
                                            icon: _productController.isDeletingData.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.visibility,color: Colors.green,));
                                      }
                                      ),
                                      Obx(() {
                                        return IconButton(
                                            onPressed: (){
                                              Get.defaultDialog(
                                                  title: "Are you sure?",
                                                  content: Text("Do you want to delete product?"),
                                                  onConfirm: (){
                                                    return  _productController.isDeletingData.value ? null :  _productController.deleteProduct(data.id.toString());
                                                  },
                                                  onCancel: ()=>Get.back()
                                              );
                                            },
                                            icon: _productController.isDeletingData.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.delete,color: Colors.red,));
                                      }
                                      ),                                ],
                                  ),
                                ),
                              ),










                            ],
                          ),
                        );
                      },
            ),
                );
                    }
                  );
                }else{
                  return Container(
                    height: 500,
                    child: ListView.builder(
                      //data length
                      itemCount: _productController.productListModel.value.data!.length,
                      itemBuilder: (context, index){


                        var data = _productController.productListModel.value!.data![index];

                        //store data variable
                        return Container(
                          height: 56,
                          margin:const EdgeInsets.only(bottom:5,top: 5),
                          padding:const EdgeInsets.only(left: 15, right: 15,bottom: 5,top: 5),
                          decoration: BoxDecoration(
                            color:Colors.grey.shade200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [



                              //Id
                              TableHeader(name:"${index+1}", width: 50),


                              //Name
                              TableHeader(name: "${data.name}", width: 200),



                              //Stock
                              TableHeader(name: "${data.isStock}", width: 80),


                              //Purchase Price
                              TableHeader(name: "${data.purchasePrice}", width: 80),



                              //Retailer Price
                              TableHeader(name: "${data.regularPrice}", width: 80),




                              //Whole Sell
                              TableHeader(name: "${data.wholePrice}", width: 90),



                              //Seller Price
                              TableHeader(name: "${data.sellingPrice}", width: 90),

                              //Status
                              TableHeader(name: "Active", width: 80),


                              //DateTime
                              TableHeader(name: "${DateFormat("dd/mm/yyyy").format(DateTime.now())}", width: 90),


                              //Action button
                              SizedBox(
                                width: 140,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            _sideBarController.index.value = 2;
                                            _productController.selectedSingleProductListModel.value = data;
                                            _productController.updateProductValue();

                                          },
                                          icon:const Icon(Icons.edit,color: Colors.amber,)
                                      ),
                                      Obx(() {
                                        return IconButton(
                                            onPressed: (){
                                              _sideBarController.index.value = 2;
                                              _productController.selectedSingleProductListModel.value = data;
                                              _productController.updateProductValue();
                                            },
                                            icon: _productController.isDeletingData.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.visibility,color: Colors.green,));
                                      }
                                      ),
                                      Obx(() {
                                        return IconButton(
                                            onPressed: (){
                                              Get.defaultDialog(
                                                  title: "Are you sure?",
                                                  content: Text("Do you want to delete product?"),
                                                  onConfirm: (){
                                                    return  _productController.isDeletingData.value ? null :  _productController.deleteProduct(data.id.toString());
                                                  },
                                                  onCancel: ()=>Get.back()
                                              );
                                            },
                                            icon: _productController.isDeletingData.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.delete,color: Colors.red,));
                                      }
                                      ),                                ],
                                  ),
                                ),
                              ),










                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            }

            }
          ) ,
          onSearch: (){
            _productController.searchOrderByCompanyName(_searchController.text);
            setState(() {

            });
          },
          onChanged: (v){
            _productController.searchOrderByCompanyName(v.toString());
            setState(() {

            });
          },
          searchController: _searchController,

        ),

      ),
    );
  }
}
