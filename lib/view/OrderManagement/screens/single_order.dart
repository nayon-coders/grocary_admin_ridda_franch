import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/app_network_image.dart';

import '../../../controller/invoice_print_controller.dart';
import '../controller/order.management.controller.dart';

class SingleOrders extends StatefulWidget {
  final String id;
  final Function(bool) onBack;
  const SingleOrders({super.key, required this.id, required this.onBack});

  @override
  State<SingleOrders> createState() => _SingleOrdersState();
}

class _SingleOrdersState extends State<SingleOrders> {

  //init orderr controller
  OrderManagementController controller =  Get.find<OrderManagementController>();



  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSingleOrder(widget.id);
    });
    return Container(
      color: Colors.white,
      padding:const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Obx((){
          return controller.isGettingData.value ? Container(
            height: MediaQuery.of(context).size.height,
          ) : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleOrderTopSection(controller: controller, onBack: ()=> widget.onBack(false)), // Indicate that the user is going back,),

                      SizedBox(height: 20,),
                      //order items list
                      SingleOrderProducts(controller: controller),
                      SizedBox(height: 20,),
                      //order summary
                      OrderSummery(controller: controller),
                      SizedBox(height: 20,),
                      //make admin suggestion how to work ing
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Admin Suggestion",
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10,),
                            Text("1s Section to see your order id and order status with delivery data.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Text("2nd section (Items) is order items means order product. You can see order products with image, name, product quantity, product price and also see the left side a icon for edit. This edit icon you can click and you can edit product price for this order.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Text("3rd Section (Order Summery) is order sub total, delivery fees, Tax amount. And how mush customer pay you and pay by you can see. ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

                SizedBox(width: 20,),
                Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //status update section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Status",
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 130,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(width: 1, color: Colors.green),
                              ),
                              child: Center(
                                child: Text(
                                  "${controller.singleOrderModel.value.order!.orderStatus}",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("You can change order status", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Obx(() {
                                // Ensure the current order status exists in the dropdown items
                                var orderStatus = controller.singleOrderModel.value.order?.orderStatus;

                                print("orderStatus ---- ${orderStatus}");

                                // List of possible dropdown values
                                final List<String> statusValues = [
                                  "En Attente",
                                  "Préparation",
                                  "Dispatch",
                                  "Livraison",
                                  "Livré",
                                  "À régler",
                                  "Terminé",
                                  "Annulé"
                                ];

                                // Set a fallback if the current value is not in the list
                                String dropdownValue = statusValues.contains(orderStatus)
                                    ? orderStatus!
                                    : statusValues.first;  // Default to first option if value is invalid

                                return DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  value: dropdownValue, // Use validated value or fallback
                                  onChanged: (value) {
                                    controller.orderStatus.value = value.toString();
                                  },
                                  items: [
                                    DropdownMenuItem(child: Text("Reçue en Attente"), value: "En Attente"),
                                    DropdownMenuItem(child: Text("En Préparation"), value: "Préparation"),
                                    DropdownMenuItem(child: Text("Prête pour Dispatch"), value: "Dispatch"),
                                    DropdownMenuItem(child: Text("En cours de Livraison"), value: "Livraison"),
                                    DropdownMenuItem(child: Text("Livré"), value: "Livré"),
                                    DropdownMenuItem(child: Text("À régler"), value: "À régler"),
                                    DropdownMenuItem(child: Text("Terminé"), value: "Terminé"),
                                    DropdownMenuItem(child: Text("Annulé"), value: "Annulé"),
                                  ],
                                );
                              }),
                            ),

                            SizedBox(height: 10),
                            Obx(() {
                              return ElevatedButton(
                                onPressed: () {
                                  controller.updateOrderStatus(controller.singleOrderModel.value.order!.id, controller.orderStatus.value);
                                },
                                child: controller.isUpdatingOrderStatus.value ? CircularProgressIndicator() : Text("Update Status"),
                              );
                            }),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      //customer info
                      OrderUserInfo(controller: controller),
                      SizedBox(height: 20,),

                      OrderCustomerContactInfo(controller: controller),
                      SizedBox(height: 20,),
                      //delivery address info
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delivery Address",
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10,),
                            Text(""
                                "${controller.singleOrderModel.value.order!.userDeliveryAddress!.city},"
                                " \n${controller.singleOrderModel.value.order!.userDeliveryAddress!.address}, ${controller.singleOrderModel.value.order!.userDeliveryAddress!.postCode}"
                                "\n\nPhone: ${controller.singleOrderModel.value.order!.userDeliveryAddress!.phone}"
                                "\nMessage: ${controller.singleOrderModel.value.order!.userDeliveryAddress!.message}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );

  }
}

class OrderCustomerContactInfo extends StatelessWidget {
  const OrderCustomerContactInfo({
    super.key,
    required this.controller,
  });

  final OrderManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact information",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10,),
          Text("${controller.singleOrderModel.value.order!.userDeliveryAddress!.phone}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text("${controller.singleOrderModel.value.order!.userDeliveryAddress!.contact}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}

class OrderUserInfo extends StatelessWidget {
  const OrderUserInfo({
    super.key,
    required this.controller,
  });

  final OrderManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Info",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10,),
          ///TODO: kause change it.. i need user info in this single order section
          Text("Company Name: ${controller.singleOrderModel.value.order!.company}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text("Company Email: ${controller.singleOrderModel.value.order!.userDeliveryAddress!.contact}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text("Phone: ${controller.singleOrderModel.value.order!.userDeliveryAddress!.contact}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}

class OrderSummery extends StatelessWidget {
  const OrderSummery({
    super.key,
    required this.controller,
  });

  final OrderManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Summary",
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10,),
          Container(
            width: 100,
            height: 25,
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.green)
            ),
            child: Center(child: Text("${controller.singleOrderModel.value!.order!.paymentMethod}", style: TextStyle(fontSize: 12),),),
          ),
          SizedBox(height: 10,),
          Text("This is your order summary",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Divider(height: 1, color: Colors.grey.shade100,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
              Text("${controller.singleOrderModel.value.order!.subTotal!.toStringAsFixed(2)}€",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tax",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
              Text("(+) ${controller.singleOrderModel.value.order!.taxAmount!.toStringAsFixed(2)}€",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
              Text("(+) ${controller.singleOrderModel.value.order!.deliveryFee!.toStringAsFixed(2)}€",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
              Text("${controller.singleOrderModel.value.order!.total!.toStringAsFixed(2)}€",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 10,),
          Divider(height: 1, color: Colors.grey.shade100,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Paid by customer",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
              Text("${controller.singleOrderModel.value.order!.total!.toStringAsFixed(2)} €",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Pay with",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
              SizedBox(width: 7,),
              Text("${controller.singleOrderModel.value.order!.paymentMethod}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
            ],
          ),

        ],
      ),
    );
  }
}



class SingleOrderProducts extends StatelessWidget {
  const SingleOrderProducts({
    super.key,
    required this.controller,
  });

  final OrderManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Items",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 10,),
          Text("Use this personalize guid to make your order",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.singleOrderModel.value.order!.products!.length,
              itemBuilder: (context, index) {
              var product = controller.singleOrderModel.value.order!.products![index];
              return Obx(() {
                  return ListTile(
                    leading: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: AppNetworkImage(image: '${product.images![0]!.imageUrl}',),
                      ),
                    title: Text("${product.name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                    subtitle: controller.isSelectedProduct[index]
                        ? AppInput(hint: "${product.price!.toStringAsFixed(2)}", controller: controller.textEditingController[index])
                        :  Text("${product.quantity} x ${product.price!.toStringAsFixed(2)}€ = ${(product.quantity! * product.price!).toStringAsFixed(2)}€",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: IconButton(
                        icon: Icon( controller.isSelectedProduct[index] ? Icons.check : Icons.edit),
                        onPressed: (){
                          if(controller.isSelectedProduct[index]){
                            //update price controller method
                            controller.updateOrderProductPrice(controller.singleOrderModel.value.order!.id, index); // Update the price of the product

                          }else{
                            //update price controller method
                          }
                          controller.isSelectedProduct[index] = !controller.isSelectedProduct[index];
                          controller.textEditingController[index].text = product.price!.toStringAsFixed(2);

                        },
                      ),
                    ),
                  );
                }
              );
            }
          )

        ],
      ),
    );
  }
}

class SingleOrderTopSection extends StatelessWidget {
   SingleOrderTopSection({
    super.key,
    required this.controller, required this.onBack,
  });

  final OrderManagementController controller;
  final VoidCallback onBack;

  InvoicePrintController invoicePrintController = Get.put(InvoicePrintController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: onBack,
              icon: Icon(Icons.arrow_back_ios),
            ),
            SizedBox(width: 10,),
            SizedBox(
              //width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Id: ${controller.singleOrderModel.value.order! .id}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  //make invoice button
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Date: ${controller.singleOrderModel!.value.order!.deliveryDate}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),


                  controller.singleOrderModel.value.order!.orderStatus == "Terminé" ?   Container(
                        margin: EdgeInsets.only(left: 200),
                        child: ElevatedButton(
                          onPressed: (){
                            invoicePrintController.singleOrderModel.value = controller.singleOrderModel.value;
                            invoicePrintController.generateInvoice(); // Generate the invoice
                          },
                          child: Text("Make Invoice"),
                        ),
                      )  :Center()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
