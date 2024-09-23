// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../comman/app_table/app.table.dart';
import '../../../comman/app_table/table.header.dart';
import '../../../comman/colors.dart';
import '../controller/user.controller.dart';

class UserListScreen extends GetView<AppUserController> {

  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        //if (width > 600) rowss() else columnss(),
        Container(
          color: Colors.white,
          padding:const EdgeInsets.all(20),
          child: AppTable(
            title: "User List",
            headersChildren:const [
              TableHeader(name: "ID", width: 30),
              TableHeader(name: "First Name", width: 130),
              TableHeader(name: "Last Name", width: 100),
              TableHeader(name: "Email", width: 120),
              TableHeader(name: "Permeation ", width: 200),
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
                        TableHeader(name:"${index+1908}", width:30),


                        //first name
                        TableHeader(name: "this first name ", width: 130),


                        //last name
                        TableHeader(name: "last name ", width: 100),


                        //Email
                        TableHeader(name: "Email@gmail.com ", width: 120),


                        //permission
                        Container(
                          width: 200,
                          child: Column(
                            children: [
                              Text("permission in user details add ")
                            ],
                          ),
                        ),


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
            searchController: _search,

          ),

        )

      ],
    );
  }




  Row rowss() {
    return Row(
      children: [
        Text(
          "All User",
          style: TextStyle(
            color: AppColor.dark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Spacer(),
        Text(
          "Pages",
          style: TextStyle(
            color: AppColor.dark,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Container(width: 10),
        Icon(Icons.chevron_right),
        Container(width: 10),
        Text(
          "All User",
          style: TextStyle(
            color: AppColor.lightdark,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Column columnss() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "All User",
            style: TextStyle(
              color: AppColor.dark,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "Pages",
              style: TextStyle(
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            Container(width: 2),
            Icon(Icons.chevron_right),
            Text(
              "All User",
              style: TextStyle(
                color: AppColor.lightdark,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
