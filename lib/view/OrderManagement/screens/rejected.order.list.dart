import 'package:flutter/material.dart';

import '../../../comman/app_table/app.table.dart';
import '../../../comman/app_table/table.header.dart';

class RejectedOrderList extends StatefulWidget {
  const RejectedOrderList({super.key});

  @override
  State<RejectedOrderList> createState() => _RejectedOrderListState();
}

class _RejectedOrderListState extends State<RejectedOrderList> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:const EdgeInsets.all(20),
      child: AppTable(
        title: "Rejected Order's",
        headersChildren:const [
          TableHeader(name: "Order ID", width: 120),
          TableHeader(name: "Payment Method", width: 120),
          TableHeader(name: "Delivery Address", width: 150),
          TableHeader(name: "Status", width: 120),
          TableHeader(name: "Date Time ", width: 120),
          TableHeader(name: "Action", width:50),




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
                  color:index.isEven?Colors.grey.shade200: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [



                    //Id
                    TableHeader(name:"${index+1908}", width:120),


                    //Payment Method
                    TableHeader(name: "Payment Method", width: 120),


                    //Delivery Address
                    TableHeader(name: "Delivery Address ", width: 150),


                    //status
                    InkWell(
                      onTap: (){},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(

                          width: 120,
                          padding: const EdgeInsets.all(5),
                          margin:const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red
                          ),
                          child: const Center(
                            child: Text("Rejected",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.white),),
                          ),
                        ),
                      ),
                    ),

                    //Date Time
                    TableHeader(name: "Date Time ", width: 120),


                    //Action button
                    SizedBox(
                      width: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(onPressed: (){}, icon:const Icon(Icons.visibility,color: Colors.green,)),
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

    );
  }
}
