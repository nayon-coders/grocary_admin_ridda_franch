import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/view/Menus/drawer.dart';
import 'package:minia_web_project/view/OrderManagement/controller/order.management.controller.dart';
import 'package:minia_web_project/view/ProductManagement/controller/product.controller.dart';

import '../../comman/colors.dart';
import '../Authentication/controller/login.controller.dart';
import '../ProductManagement/controller/category.controller.dart';
import '../ProductManagement/controller/postcode.controller.dart';

class LargeScreenMenus extends GetView<SideBarController> {
  const LargeScreenMenus({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      // width: 250,
      width: 250,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.backgorundDrawer,
            border: Border(
              right: BorderSide(color: AppColor.boxborder),
            )),
        // color: Color.fromARGB(255, 224, 209, 249),
        child: Obx(
              () => ListView(
            physics: ScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/minia_logo.svg",
                      fit: BoxFit.contain,
                      height: 25,
                      width: 25,
                    ),
                    Container(width: 10),
                    Text(
                      "Grocary Admin",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          controller.expandOrShrinkDrawer();
                        },
                        child: Icon(Icons.menu)),
                  ],
                ),
              ),
              Container(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Container(height: 10),
              CommanListTile(
                minWidth: 40,
                text: "Dashboard",
                icon: "assets/svg/dashboard/home_non.svg",
                color:
                controller.index.value == 0 ? AppColor.selecteColor : null,
                onTap: () => controller.index.value = 0,
                selected: controller.index.value == 0,
              ),


              //product management
              ExpansionListCustom(
                title: "Product Management",
                icon: "assets/svg/dashboard/grid_box.svg",
                color:
                controller.index.value == 1 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: 'All product',
                    color: controller.index.value == 1
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                     Get.put(ProductController()); //product controller

                      controller.index.value = 1;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Add new product',
                    color: controller.index.value == 2
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.put(LoginController());
                      controller.index.value = 2;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Add new category',
                    color: controller.index.value == 3
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.put(CategoryController()); //controller inject
                      controller.index.value = 3;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Add post code',
                    color: controller.index.value == 4
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.put(PostCodeController()); //inject post code controller
                      controller.index.value = 4;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),

                ],
              ),


              //Order management
              ExpansionListCustom(
                title: "Order Management",
                icon: "assets/svg/dashboard/grid_box.svg",
                color:
                controller.index.value == 5 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: 'All Orders',
                    color: controller.index.value == 5
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.put(OrderManagementController());
                      controller.index.value = 5;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Pending Order',
                    color: controller.index.value == 6
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 6;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Accept Order',
                    color: controller.index.value == 7
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 7;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Prepared Order',
                    color: controller.index.value == 8
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 8;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Cancel Order',
                    color: controller.index.value == 9
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 9;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),

                  Menu(
                    text: 'Cancel Order',
                    color: controller.index.value == 10
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 10;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),

                  Menu(
                    text: 'Rejected Order',
                    color: controller.index.value == 11
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 11;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),

                ],
              ),


              //User management
              ExpansionListCustom(
                title: "User Management",
                icon: "assets/svg/dashboard/grid_box.svg",
                color:
                controller.index.value == 12 ? AppColor.selecteColor : null,
                children: [

                  Menu(
                    text: 'New Users',
                    color: controller.index.value == 13
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 13;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Accepted User',
                    color: controller.index.value == 14
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 14;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Block Users',
                    color: controller.index.value == 15
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 15;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),

                  Menu(
                    text: 'Add New User',
                    color: controller.index.value == 12
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 12;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),

                ],
              ),


              //admin management
              ExpansionListCustom(
                title: "Admin Management",
                icon: "assets/svg/dashboard/grid_box.svg",
                color:
                controller.index.value == 16 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: 'Add new admin',
                    color: controller.index.value == 16
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 16;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Admin List',
                    color: controller.index.value == 17
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 17;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),


                ],
              ),


              //Site setting management
              ExpansionListCustom(
                title: "App Setting",
                icon: "assets/svg/dashboard/grid_box.svg",
                color:
                controller.index.value == 18 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: 'Site Settings',
                    color: controller.index.value == 18
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 18;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Page Setting',
                    color: controller.index.value == 19
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 19;
                      width < 983 ? controller.expandOrShrinkDrawer() : null;
                    },
                  ),


                ],
              ),




              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  height: 276,
                  decoration: BoxDecoration(
                    color: AppColor.selecteColor.withOpacity(.10),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Container(height: 20),
                      Image.asset("assets/image/gift.png", fit: BoxFit.cover),
                      Container(height: 22),
                      Text(
                        "Unlimited Access",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.selecteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(height: 7),
                      Text(
                        """Upgrade your plan from a
Free trial, to select
‘Business Plan’.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.dark,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(height: 23),
                      Container(
                        height: 38,
                        width: 110,
                        decoration: BoxDecoration(
                          color: AppColor.selecteColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            "Upgrade Now",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.mainbackground,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
