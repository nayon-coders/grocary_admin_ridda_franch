import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/data/global/global_variable.dart';
import 'package:minia_web_project/view/AppSetting/controller/setting_controller.dart';
import 'package:minia_web_project/view/Menus/drawer.dart';
import 'package:minia_web_project/view/OrderManagement/controller/order.management.controller.dart';
import 'package:minia_web_project/view/ProductManagement/controller/product.controller.dart';
import 'package:minia_web_project/view/user_management/controller/user.controller.dart';

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
                child: Image.asset("assets/image/logo.png" , width: 100, height: 40,)
              ),
              Container(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(height: 10),

              CommanListTile(
                      minWidth: 40,
                      text: "Dashboard",
                      icon: Icons.dashboard,
                      color:
                      controller.index.value == 0 ? AppColor.selecteColor : null,
                      onTap: () {
                        // //order controller inject
                        // Get.put(OrderManagementController());
                        // //product controller inject
                        // Get.put(ProductController());
                        controller.index.value = 0;
                        controller.isDashboard.value = true;

                        print("controller.isDashboard.value --- ${controller.isDashboard.value}");


                      },
                      selected: controller.index.value == 0,
                    ),




              //product management
              // Product Management
              InkWell(
                onTap: (){
                  controller.isDashboard.value = false;
                },
                child: ExpansionListCustom(
                  onTap: () {
                    //controller.isDashboard.value = false;
                  },
                  isSeleteed: controller.index.value == 1,
                  title: "Product Management",
                  icon: Icons.production_quantity_limits,
                  color: controller.index.value == 1 ? AppColor.selecteColor : null,
                  children: [
                    if (controller.hasPermission(1)) // Check permission for "All Products"
                      Menu(
                        text: 'All product',
                        color: controller.index.value == 1 ? AppColor.selecteColor : null,
                        onTap: () {
                          Get.put(ProductController()); // Inject Product controller
                          controller.index.value = 1;
                          width < 983 ? controller.expandOrShrinkDrawer() : null;
                        },
                      ),
                    if (controller.hasPermission(2)) // Check permission for "Add New Product"
                      Menu(
                        text: 'Add new product',
                        color: controller.index.value == 2 ? AppColor.selecteColor : null,
                        onTap: () {
                          Get.put(ProductController());
                          controller.index.value = 2;
                          width < 983 ? controller.expandOrShrinkDrawer() : null;
                        },
                      ),
                    if (controller.hasPermission(3)) // Check permission for "Add New Category"
                      Menu(
                        text: 'Add new category',
                        color: controller.index.value == 3 ? AppColor.selecteColor : null,
                        onTap: () {
                          Get.put(CategoryController()); // Inject Category controller
                          controller.index.value = 3;

                          width < 983 ? controller.expandOrShrinkDrawer() : null;
                        },
                      ),
                    if (controller.hasPermission(4)) // Check permission for "Add Post Code"
                      Menu(
                        text: 'Add post code',
                        color: controller.index.value == 4 ? AppColor.selecteColor : null,
                        onTap: () {
                          Get.put(PostCodeController()); // Inject PostCode controller
                          controller.index.value = 4;

                          width < 983 ? controller.expandOrShrinkDrawer() : null;
                        },
                      ),
                  ],
                ),
              ),



              //Order management
              InkWell(
                onTap: (){
                  controller.isDashboard.value = false;
                  Get.put(OrderManagementController());
                },
                child: ExpansionListCustom(
                  onTap: (){


                  },
                  isSeleteed: controller.index.value == 5,
                  title: "Order Management",
                  icon: Icons.list_alt,
                  color:
                  controller.index.value == 5 ? AppColor.selecteColor : null,
                  children: [
                    if (controller.hasPermission(5)) // Check permission for "All Products"
                      Menu(
                      text: 'All Orders',
                      color: controller.index.value == 5
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        Get.find<OrderManagementController>().getAllOrder();
                        controller.index.value = 5;

                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),
                    if (controller.hasPermission(6)) // Check permission for "All Products"
                      Menu(
                      text: 'Reçue en Attente', //Received Pending
                      color: controller.index.value == 6
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        controller.index.value = 6;
                        Get.find<OrderManagementController>().getAllOrder();
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),
                    if (controller.hasPermission(7)) // Check permission for "All Products"
                      Menu(
                      text: 'En Préparation', //In Preparation accept
                      color: controller.index.value == 7
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        Get.find<OrderManagementController>().getAllOrder();
                        controller.index.value = 7;
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),

                    if (controller.hasPermission(8)) // Check permission for "All Products"
                      Menu(
                      text: 'Prête pour Dispatch', //Ready for Dispatch
                      color: controller.index.value == 8
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        Get.find<OrderManagementController>().getAllOrder();
                        controller.index.value = 8;
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),

                    if (controller.hasPermission(9)) // Check permission for "All Products"
                      Menu(
                      text: 'Livré', //In Delivery
                      color: controller.index.value == 9
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        Get.find<OrderManagementController>().getAllOrder();
                        controller.index.value = 9;
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),


                    if (controller.hasPermission(10)) // Check permission for "All Products"
                      Menu(
                      text: 'Annulé', //cancel order
                      color: controller.index.value == 10
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        Get.find<OrderManagementController>().getAllOrder();
                        controller.index.value = 10;
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),


                    if (controller.hasPermission(11)) // Check permission for "All Products"
                      Menu(
                      text: 'Terminé', //To be Paid
                      color: controller.index.value == 11
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        Get.find<OrderManagementController>().getAllOrder();
                        controller.index.value = 11;
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),

                  ],
                ),
              ),


              //User management
              InkWell(
                onTap: (){
                  controller.isDashboard.value = false;
                  Get.put(AppUserController());
                  print("click order");
                },
                child: ExpansionListCustom(
                  onTap: ()=>controller.isDashboard.value = false,
                  isSeleteed: controller.index.value == 12,
                  title: "User Management",
                  icon: Icons.people_alt_outlined,
                  color:
                  controller.index.value == 12 ? AppColor.selecteColor : null,
                  children: [
                    if (controller.hasPermission(13)) // Check permission for "All Products"
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

                    if (controller.hasPermission(14)) // Check permission for "All Products"
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

                    if (controller.hasPermission(15)) // Check permission for "All Products"
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

                    // Menu(
                    //   text: 'Add New User',
                    //   color: controller.index.value == 12
                    //       ? AppColor.selecteColor
                    //       : null,
                    //   onTap: () {
                    //     controller.index.value = 12;
                    //     width < 983 ? controller.expandOrShrinkDrawer() : null;
                    //   },
                    // ),

                  ],
                ),
              ),


              //admin management
              InkWell(
                onTap: (){
                  controller.isDashboard.value = false;
                  print("click order");
                },
                child: ExpansionListCustom(
                  onTap: ()=>controller.isDashboard.value = false,
                  isSeleteed: controller.index.value == 16,
                  title: "Admin Management",
                  icon: Icons.admin_panel_settings_outlined,
                  color:
                  controller.index.value == 16 ? AppColor.selecteColor : null,
                  children: [
                    if (controller.hasPermission(16)) // Check permission for "All Products"
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

                    if (controller.hasPermission(17)) // Check permission for "All Products"
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
              ),


              //Site setting management
              InkWell(
                onTap: (){
                  controller.isDashboard.value = false;
                  Get.put(SettingControleler()); 
                  print("SettingControleler init");
                },
                child: ExpansionListCustom(
                  onTap: (){},
                  isSeleteed: controller.index.value == 18,
                  title: "App Setting",
                  icon: Icons.settings,
                  color:
                  controller.index.value == 18 ? AppColor.selecteColor : null,
                  children: [
                    if (controller.hasPermission(18)) // Check permission for "All Products"
                      Menu(
                      text: 'Settings',
                      color: controller.index.value == 18
                          ? AppColor.selecteColor
                          : null,
                      onTap: () {
                        controller.index.value = 18;
                        width < 983 ? controller.expandOrShrinkDrawer() : null;
                      },
                    ),

                    if (controller.hasPermission(19)) // Check permission for "All Products"
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
              ),




//               Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Container(
//                   height: 276,
//                   decoration: BoxDecoration(
//                     color: AppColor.selecteColor.withOpacity(.10),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Column(
//                     children: [
//                       Container(height: 20),
//                       Image.asset("assets/image/gift.png", fit: BoxFit.cover),
//                       Container(height: 22),
//                       Text(
//                         "Unlimited Access",
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: AppColor.selecteColor,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Container(height: 7),
//                       Text(
//                         """Upgrade your plan from a
// Free trial, to select
// ‘Business Plan’.""",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: AppColor.dark,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Container(height: 23),
//                       Container(
//                         height: 38,
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: AppColor.selecteColor,
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Upgrade Now",
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: AppColor.mainbackground,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
            ],
          ),
        ),
      ),
    );
  }
}
