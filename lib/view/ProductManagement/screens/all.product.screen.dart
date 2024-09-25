import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app_table/app.table.dart';
import 'package:minia_web_project/view/ProductManagement/controller/product.controller.dart';

import '../../../comman/app_table/table.header.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final _searchController = TextEditingController();

  ProductController productController = Get.find();

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
          row:Container(
            height: 500,
            child: ListView.builder(
              //data length
              itemCount: 33,
              itemBuilder: (context, index){



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
                      TableHeader(name: "product name ", width: 200),



                      //Stock
                      TableHeader(name: "${index+2}", width: 80),


                      //Purchase Price
                      TableHeader(name: "Purchase Price", width: 80),
                      


                      //Retailer Price
                      TableHeader(name: "Retailer Price", width: 80),




                      //Whole Sell
                      TableHeader(name: "Whole Sell", width: 90),



                    //Seller Price
                      TableHeader(name: "Seller Price", width: 90),

                    //Status
                      TableHeader(name: "Active", width: 80),


                    //DateTime
                      TableHeader(name: "22/10/2024", width: 90),


                      //Action button
                        SizedBox(
                        width: 140,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){}, icon:const Icon(Icons.edit,color: Colors.amber,)),
                              IconButton(onPressed: (){}, icon:const Icon(Icons.visibility,color: Colors.green,)),
                              IconButton(onPressed: (){}, icon:const Icon(Icons.delete,color: Colors.red,)),
                            ],
                          ),
                        ),
                      ),










                    ],
                  ),
                );
              },
            ),
          ) ,
          onSearch: (){},
          searchController: _searchController,

        ),

      ),
    );
  }
}
