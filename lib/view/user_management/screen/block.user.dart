import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:minia_web_project/controller/app.alert.dart';
import 'package:minia_web_project/controller/editable_controller.dart';
import 'package:minia_web_project/view/user_management/controller/user.controller.dart';

import '../../../comman/app_table/app.table.dart';
import '../../../comman/app_table/table.header.dart';
import 'single_customer_view.dart';

class BlockUser extends StatefulWidget{

  @override
  State<BlockUser> createState() => _BlockUserState();
}

class _BlockUserState extends State<BlockUser> {
  final _search = TextEditingController();

  AppUserController controller = Get.put(AppUserController());

  bool isShowSingleCustomer = false;

  var _selectedUserId;

  showingSingleCustomer(bool value){
    setState(() {
      isShowSingleCustomer = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllUser("1");
    });
    return isShowSingleCustomer ? SingleCustomer(onBack: showingSingleCustomer, id: _selectedUserId.toString()) : Container(
      padding:const EdgeInsets.all(20),
      child: AppTable(
        title: "New Customer List",
        pageLength: controller.userListModel.value!.totalPages,
        onPageBack: (){
          if(controller.userListModel.value.currentPage != 1){
            controller.getAllUser("${controller.userListModel.value.currentPage! - 1}");
          }
        },
        onPageFront: (){
          if(controller.userListModel.value.currentPage! > 1){
            controller.getAllUser("${controller.userListModel.value.currentPage! + 1}");
          }
        },
        headersChildren:const [
          TableHeader(name: "ID", width: 30),
          TableHeader(name: "Name", width: 70),
          TableHeader(name: "Brand", width: 100),
          TableHeader(name: "Email", width: 200),
          TableHeader(name: "Phone Number ", width: 100),
          TableHeader(name: "Account Type", width: 100),
          TableHeader(name: "Status", width: 60),
          TableHeader(name: "Date", width: 90),
          TableHeader(name: "Action", width:120),




        ],
        row:Container(
          height: 500,
          child: Obx(() {
            if(controller.isLoading.value){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return Obx(() {
                return  controller.blockUserList.value.isEmpty ? Center(child: Text("Empty!"),) :ListView.builder(
                  //data length
                  itemCount: controller.blockUserList.value.length,
                  itemBuilder: (context, index){

                    var data =  controller.blockUserList.value[index];

                    //store data variable
                    return Obx(() {
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
                            SizedBox(
                              width: 30,
                              child: Text("${index+1}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),


                            //first name
                            //Id
                            AppTableRow(name: data.name!, width: 70),
                            AppTableRow(name: data.brand!, width: 100),
                            AppTableRow(name: data.email!, width: 200),
                            AppTableRow(name: data.accountPhone!, width: 100),
                            AppTableRow(name: data.accountType!, width: 100),

                            SizedBox(
                              width: 60,
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade200,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("${data.status}"),
                                ),
                              ),
                            ),

                            AppTableRow(name: DateFormat("MMM dd, yyyy").format(DateTime.parse("${"${data.createAt}"}"))!, width: 100),


                            //Action button
                            SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                          onPressed: ()async{
                                            await confirmAlert(
                                                context: context,
                                                body: "Do you want to Active this user?",
                                                onOk: ()async{
                                                  await controller.updateUserStatus(data.id.toString(), "active");
                                                  Get.back();
                                                }
                                            );
                                          },

                                          icon: controller.isUpdating.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.approval,color: Colors.green,)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                          onPressed: ()async{
                                            await confirmAlert(
                                                context: context,
                                                body: "Do you want to block this user?",
                                                onOk: ()async{
                                                  await controller.updateUserStatus(data.id.toString(), "block");
                                                  Get.back();
                                                }
                                            );
                                          },
                                          icon: controller.isUpdating.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.block,color: Colors.black,)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                          onPressed: ()async{
                                            setState(() {
                                              _selectedUserId = data.id.toString();
                                              isShowSingleCustomer = true;
                                            });
                                          },
                                          icon: controller.isUpdating.value ? Center(child: CircularProgressIndicator(),) : Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                    ),

                                  ],
                                )
                            ),










                          ],
                        ),
                      );
                    }
                    );
                  },
                );
              }
              );
            }

          }
          ),
        ) ,
        onSearch: (){},
        searchController: _search,

      ),

    );
  }
}
