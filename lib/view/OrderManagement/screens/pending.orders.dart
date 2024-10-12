import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/view/OrderManagement/screens/single_order.dart';
import 'package:minia_web_project/view/OrderManagement/widgets/top_box.dart';

import '../../../comman/app_table/app.table.dart';
import '../../../comman/app_table/table.header.dart';
import '../controller/order.management.controller.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({super.key});

  @override
  State<PendingOrder> createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  final _searchController = TextEditingController();

  OrderManagementController controller =  Get.put(OrderManagementController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  bool isSingleOrder = false;
  var _selectedOrderId;

  onBack(bool value){
    setState(() {
      isSingleOrder = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSingleOrder ? SingleOrders(id: _selectedOrderId!, onBack: onBack,) : Container(
      color: Colors.white,
      padding:const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Order Summary",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
            OrdersBox(width: MediaQuery.of(context).size.width),
            SizedBox(height: 20,),
            AppTable(
              //pageLength: controller.allOrderModel.value.totalOrders!,
              title: "Reçue en Attente",
              headersChildren:const [
                TableHeader(name: "ID", width: 30),
                TableHeader(name: "Company name", width: 150),
                TableHeader(name: "Payment Method", width: 120),
                TableHeader(name: "Delivery Address", width: 250),
                TableHeader(name: "Status", width: 120),
                TableHeader(name: "Date Time ", width: 120),
                TableHeader(name: "Action", width:50),

              ],
              row: Container(
                height: 500,
                child: Obx(() {
                  if(controller.isGettingData.value){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(controller.totalPendingOrder.value.isNotEmpty){
                    return ListView.builder(
                      //data length
                      itemCount: controller.totalPendingOrder.value.length,
                      itemBuilder: (context, index){
                        //store data variable
                        var data = controller.allOrderModel.value.data![index] ;
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
                                        color: Colors.green.withOpacity(0.2),
                                        border: Border.all(width: 1, color: Colors.green)
                                    ),
                                    child: Center(
                                      child: Text("${data.orderStatus}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.green),),
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
                                    setState(() {
                                      _selectedOrderId= data.id.toString();
                                      isSingleOrder = true;
                                    });
                                  }, icon:const Icon(Icons.visibility,color: Colors.green,)),
                                ),
                              ),










                            ],
                          ),
                        );
                      },
                    );
                  }else{
                    return Center(child: Text("No Data Found"));
                  }

                }
                ),
              ) ,
              onSearch: (){},
              searchController: _searchController,

            ),
          ],
        ),

      ),
    );
  }
}
