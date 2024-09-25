import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/app_table/app.table.dart';

import '../../../comman/app_table/table.header.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final _searchController = TextEditingController();
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

                      SizedBox(
                          width: 50,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${index+1}",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                      //Name

                      SizedBox(
                          width: 200,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("product name",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),



                      //Stock

                      SizedBox(
                          width: 80,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${index+2}",style:const  TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                      //Purchase Price

                      SizedBox(
                          width: 80,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Purchase Price",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),
                      


                      //Retailer Price

                      SizedBox(
                          width: 80,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Retailer Price",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),




                      //Whole Sell

                      SizedBox(
                          width: 90,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Whole Sell",style:const  TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),



                    //Seller Price

                      SizedBox(
                          width: 90,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Seller Price",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),

                    //Status

                      SizedBox(
                          width: 80,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Active",style:const  TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                    //DateTime

                      SizedBox(
                          width: 90,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("22/10/2024",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


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
