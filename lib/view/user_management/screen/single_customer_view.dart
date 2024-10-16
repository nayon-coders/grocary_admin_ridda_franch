import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/controller/editable_controller.dart';

import '../controller/user.controller.dart';

class SingleCustomer extends StatefulWidget {
  final Function(bool) onBack;
  final String id;

  const SingleCustomer({super.key, required this.onBack, required this.id});

  @override
  State<SingleCustomer> createState() => _SingleCustomerState();
}

class _SingleCustomerState extends State<SingleCustomer> {
  //usercontrpller

  AppUserController controller = Get.put(AppUserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          SingleCustomerTop(widget: widget),
          SizedBox(height: 30,),
          //body
          Obx((){
            if(controller.isLoading.value){
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            }else{
              //input all field with title and value
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20), 
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //account create date
                        Text("Account Created Date: ${controller.singleCustomerModel.value.createAt}", style: TextStyle(fontSize: 12),),
                        SizedBox(height: 10,),
                        //account status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Account Status: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                                SizedBox(width: 7,),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: controller.getCustomerStatusColor(controller.singleCustomerModel.value.status!).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1, color: controller.getCustomerStatusColor(controller.singleCustomerModel.value.status!))
                                  ),
                                  child: Text(controller.singleCustomerModel.value.status.toString(), style: TextStyle(color: Colors.black, fontSize: 12),),
                                )
                              ],
                            ),

                            Row(
                              children: [
                                Text("Account Type: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                                SizedBox(width: 7,),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(width: 1, color:Colors.amber)
                                  ),
                                  child: Text(controller.singleCustomerModel.value.accountType.toString(), style: TextStyle(color: Colors.black, fontSize: 12),),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Expanded(
                              child: AppInput(hint: "Name", controller: controller.nameController.value),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: AppInput(hint: "Email", controller: controller.emailController.value, readOnly:  true,),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: AppInput(hint: "Account Phone", controller: controller.accountPhoneController.value),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: AppInput(hint: "Brand", controller: controller.brandController.value),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Expanded(
                              child: AppInput(hint: "City", controller: controller.cityController.value),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: AppInput(hint: "Company", controller: controller.companyController.value),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Expanded(
                              child: AppInput(hint: "Contract Comptabilite", controller: controller.contractComptabiliteController.value),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: AppInput(hint: "Contract Facturation", controller: controller.contractFacturationController.value),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Expanded(
                              child: AppInput(hint: "Post Code", controller: controller.postCodeController.value),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: AppInput(hint: "Siret", controller: controller.siretController.value),
                            )
                          ],
                        ),
                        
                        SizedBox(height: 20,),
                        //update button 
                        Obx(() {
                            return ElevatedButton(
                              onPressed: (){
                                controller.updateUser(widget.id.toString());
                              },
                              child: controller.isUpdating.value ? Center(child: CircularProgressIndicator(),) : Text("Update"),
                            );
                          }
                        )

                      ],
                    ),
                  ),
                ],
              ); 
            }
          })

        ],
      ),
    );
  }
}

class SingleCustomerTop extends StatelessWidget {
  const SingleCustomerTop({
    super.key,
    required this.widget,
  });

  final SingleCustomer widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: ()=> widget.onBack(false), icon: Icon(Icons.arrow_back_ios)),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Customer Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7,),
            Text("Update your personal details and photo here.", style: TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
