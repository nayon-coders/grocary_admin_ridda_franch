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
        if (width > 600) rowss() else columnss(),


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
