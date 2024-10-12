import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minia_web_project/view/AdminManagement/controller/admin.role.controller.dart';

import '../../../comman/app_table/app.table.dart';
import '../../../comman/app_table/table.header.dart';

class AdminList extends StatelessWidget {

  final _search = TextEditingController();
  final controller = Get.put(AdminRoleController());

  @override
  Widget build(BuildContext context) {
    controller.getAllAdmin();
    return Column(
      children: [
        //if (width > 600) rowss() else columnss(),
        Container(

          padding:const EdgeInsets.all(20),
          child: AppTable(
            title: "Admin List",
            headersChildren:const [
              TableHeader(name: "ID", width: 50),
              TableHeader(name: "First Name", width: 130),
              TableHeader(name: "Last Name", width: 130),
              TableHeader(name: "Email", width: 200),
              TableHeader(name: "Permeation ", width: 150),
              TableHeader(name: "Role", width:100),




            ],
            row:Container(
              height: 500,
              child: Obx(() {
                  return ListView.builder(
                    //data length
                    itemCount: controller.allAdminListModel.value.data!.length,
                    itemBuilder: (context, index){

                    var data = controller.allAdminListModel.value.data![index];

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
                            AppTableRow(
                              name: '${index+1}',
                              width: 50,
                            ),


                            //first name
                            //Id
                            AppTableRow(
                              name: '${data.firstName}',
                              width: 130,
                            ),


                            //last name
                            AppTableRow(
                              name: '${data.lastName}',
                              width: 130,
                            ),


                            //Email
                            AppTableRow(
                              name: '${data.email}',
                              width: 200,
                            ),


                            //permission
                            SizedBox(
                              width: 150,
                              child: TextButton(
                                onPressed: (){},
                                child: Text("See Permissions"),
                              ),
                            ),


                            //Action button
                            Container(
                              width: 100,
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.green.shade200,
                                ),
                                child: Center(
                                  child: Text("${data.roleName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13
                                    ),
                                  ),
                                ),
                              ),
                            )










                          ],
                        ),
                      );
                    },
                  );
                }
              ),
            ) ,
            onSearch: (){},
            searchController: _search,

          ),

        )

      ],
    );
  }
}
