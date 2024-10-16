import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:minia_web_project/view/OrderManagement/controller/order.management.controller.dart';

import '../../../comman/app_table/table.header.dart';
import '../../../data/model/all_order_model.dart';
class OrderListWidget extends StatelessWidget {
  final List<OrderItem> orderList;
  final OrderManagementController controller;
  OrderListWidget({required this.orderList, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //data length
      itemCount: orderList!.length,
      itemBuilder: (context, index){
        //store data variable
        var data = orderList![index] ;
        return Container(
          height: 56,
          margin:const EdgeInsets.only(bottom:5,top: 5),
          padding:const EdgeInsets.only(left: 15, right: 15,bottom: 5,top: 5),
          decoration: BoxDecoration(
            color:index.isEven?Colors.grey.shade100: Colors.grey.shade50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [



              //Id
              TableHeader(name:"${index+1}", width: 30),


              //Company Name
              TableHeader(name: "${data.company}", width: 150),



              //Payment Method
              TableHeader(name: "${data.paymentMethod}", width: 120),


              //Delivery Address
              TableHeader(name: "${data.userDeliveryAddress!.postCode}, ${data.userDeliveryAddress!.city}, ${data.userDeliveryAddress!.address}", width: 250),


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
                        borderRadius: BorderRadius.circular(100),
                        color: controller.getOrderStatusColor(data.orderStatus!).withOpacity(0.2),
                        border: Border.all(width: 1, color: controller.getOrderStatusColor(data.orderStatus!))
                    ),
                    child: Center(
                      child: Text("${data.orderStatus}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),),
                    ),
                  ),
                ),
              ),

              //Date Time
              TableHeader(name: "${data.deliveryDate}", width: 120),


              //Action button
              SizedBox(
                width: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(onPressed: (){
                    // setState(() {
                    //   _selectedOrderId= data.id.toString();
                    //   isSingleOrder = true;
                    // });
                  }, icon:const Icon(Icons.visibility,color: Colors.green,)),
                ),
              ),










            ],
          ),
        );
      },
    );
  }
}
