// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, depend_on_referenced_packages, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minia_web_project/data/global/global_variable.dart';
import 'package:minia_web_project/main.dart';
import 'package:minia_web_project/view/Authentication/pages/log_out.dart';
import 'package:minia_web_project/view/Menus/large.screen.menus.dart';
import '../../comman/colors.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/sidebar_controller.dart';
import '../Authentication/controller/login.controller.dart';
import '../OrderManagement/controller/order.management.controller.dart';
import '../ProductManagement/controller/category.controller.dart';
import '../ProductManagement/controller/postcode.controller.dart';
import '../ProductManagement/controller/product.controller.dart';

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  RxBool isExpanded = true.obs;
  RxBool hide = true.obs;

  // RxInt iSIndex = 0.obs;
  SideBarController controller = Get.put(SideBarController());
  final DashboardController dashcontroller = Get.put(DashboardController());
  final GlobalKey<_SideBarPageState> button1Key = GlobalKey();
  final GlobalKey<_SideBarPageState> button2Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // iSIndex.value = controller.index.value;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.mainbackground,
      appBar: width < 983 ? smallAppBar(width) : null,
      drawer: smallDrawer(),
      body: Row(
        children: [
          isExpanded.isFalse && width > 983
              ? sideBarIcon(controller)
              : width > 983
                  ? LargeScreenMenus()
                  : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                width > 983 ? Appbar(width) : Container(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 18, bottom: 20),
                          child: Container(
                            color: AppColor.mainbackground,
                            child: Obx(
                              () => controller.page[controller.index.value],
                            ),
                          ),
                        ),
                        Divider(color: AppColor.boxborder, height: 1),
                        bottomText()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //small device
  //
  //
  //  //small device
  Drawer smallDrawer() {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 900,
              width: 250,
              child: Container(
                // color: Color.fromARGB(255, 224, 209, 249),
                color: AppColor.backgorundDrawer,
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
                          controller.index.value = 0;
                          controller.isDashboard.value = true;
                          print("controller.isDashboard.value --- ${controller.isDashboard.value}");


                        },
                        selected: controller.index.value == 0,
                      ),




                      //product management
                      // Product Management
                      ExpansionListCustom(
                        onTap: () {
                          controller.isDashboard.value = false;
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



                      //Order management
                      ExpansionListCustom(
                        onTap: ()=>controller.isDashboard.value = false,
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
                                Get.put(OrderManagementController());
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
                                controller.index.value = 11;
                                width < 983 ? controller.expandOrShrinkDrawer() : null;
                              },
                            ),

                        ],
                      ),


                      //User management
                      ExpansionListCustom(
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


                      //admin management
                      ExpansionListCustom(
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


                      //Site setting management
                      ExpansionListCustom(
                        onTap: ()=>controller.isDashboard.value = false,
                        isSeleteed: controller.index.value == 18,
                        title: "App Setting",
                        icon: Icons.settings,
                        color:
                        controller.index.value == 18 ? AppColor.selecteColor : null,
                        children: [
                          if (controller.hasPermission(18)) // Check permission for "All Products"
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
            ),
          ],
        ),
      ),
    );
  }
  //
  //  //small device
  //small device

  AppBar smallAppBar(double width) {
    return AppBar(
        elevation: 1,
        backgroundColor: AppColor.mainbackground,
        toolbarHeight: 72,
        leadingWidth: width > 400
            ? 80
            : width > 280
                ? 0
                : 0,
        leading: Container(
          color: AppColor.selecteColor.withOpacity(.10),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("assets/image/logo.png"),
          ),
        ),
        title: Container(
          width: double.infinity,
          child: Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  hoverColor: AppColor.mainbackground,
                  highlightColor: AppColor.mainbackground,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: AppColor.black,
                  ),
                ),
              ),
              Spacer(),

              _offsetProfile(width),
            ],
          ),
        ));
  }

  String dropDownValue2 = "one";
  String dropDownValue = "one";

  Row Appbar(double width) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppColor.boxborder))),
            height: 72,
            // width: 400,
            child: Row(
              children: [
                Container(width: 15),
                isExpanded.isFalse && width > 983
                    ? InkWell(
                        onTap: () {
                          expandOrShrinkDrawer();
                        },
                        child: Icon(Icons.menu),
                      )
                    : Container(),
                Container(width: 15),
                Text("You are: ${sharedPreferences!.getString("role") ?? "nayon "} " ),

                Spacer(),
                _offsetProfile(width),
                Container(width: width > 1200 ? 35 : 20),
              ],
            ),
          ),
        ),
      ],
    );
  }


  final loginController = Get.find<LoginController>();
  Widget _offsetProfile(width) => PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 128,
          minWidth: 160,
          maxWidth: 165,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'logout',
            height: 38,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0),
                  child: Divider(color: AppColor.borders, thickness: 1.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 15),
                      Container(width: 5),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 13.5,
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
        onSelected: (value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Logout()));
        },
        offset: Offset(0, 72),
        child: width > 1200
            ? Container(
                width: 148,
                height: 72,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.boxborder),
                    color: AppColor.selecteColor.withOpacity(.06)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/image/profile.png",
                        fit: BoxFit.cover,
                        height: 35,
                        width: 35,
                      ),
                      Container(width: 6),
                      Obx((){
                          return Expanded(
                            child: Text(
                              "${loginController.myprofiel.value.firstName} ${loginController.myprofiel.value.lastName}",
                              style: TextStyle(
                                  fontSize: 13.5,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                      ),
                      Container(width: 10),
                      Icon(Icons.keyboard_arrow_down_rounded, size: 15)
                    ],
                  ),
                ),
              )
            : Container(
                width: 70,
                height: 72,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.boxborder),
                    color: AppColor.selecteColor.withOpacity(.06)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        "assets/image/profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
      );

  Widget _offsetPopup(width) => PopupMenuButton<int>(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 330,
          minWidth: 250,
          maxWidth: 310,

          // minHeight: 50,
          // maxHeight: 330,
          // minWidth: 250,
          // maxWidth: 310,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF313533)),
                    ),
                    Spacer(),
                    Text(
                      "Unread",
                      style: TextStyle(
                          fontSize: 11.2,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2C302E)),
                    )
                  ],
                ),
                Container(height: 30),
                Notifcations(
                  networkImage: "assets/image/avatar2.png",
                  name: "James Lemire",
                  message: "It will seem like simplified English,",
                  time: "1 hour ago",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(
                left: 16.0,
                right: width > 325 ? 16.0 : 0,
                top: 10.0,
                bottom: 16),
            child: Column(
              children: [
                NotifcationsIcon(
                  icon: Icons.shopping_cart_outlined,
                  name: "Your order is placed",
                  message: "If serveral language coalesce the grammar",
                  time: "3 min ago",
                  backgroundColor: AppColor.selecteColor,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(
                left: 16.0,
                right: width > 325 ? 16.0 : 0,
                top: 10.0,
                bottom: 16),
            child: Column(
              children: [
                NotifcationsIcon(
                  icon: Icons.check_circle_outline_outlined,
                  name: "Your item is shipped",
                  message: "If serveral language coalesce the grammar",
                  time: "3 min ago",
                  backgroundColor: AppColor.darkGreen,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(
                left: 16.0,
                right: width > 325 ? 16.0 : 0,
                top: 10.0,
                bottom: 16),
            child: Notifcations(
              networkImage: "assets/image/avatar4.png",
              name: "Salena Layfield",
              message: "As a skeptical Cambridge friend of mine occidental",
              time: "1 hour ago",
            ),
          ),
        ],
        icon: NamedIcon(text: "5", iconData: Icons.notifications_none_rounded),
        offset: Offset(0, 56),
      );

  Container Localzations() {
    return Container(
      width: 85,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Container(),
          // underline: Container(),
          value: dropDownValue2,

          items: [
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              value: "one",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/us.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "English",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('es', 'ES'));
              },
              value: "two",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/spain.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "Spanish",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('de', 'CH'));
              },
              value: "three",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/germany.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "German",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('it', 'CH'));
              },
              value: "four",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/italy.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 18),
                  Text(
                    "Italian",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('ru', 'RU'));
              },
              value: "five",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/russia.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "Russian",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
          ],
          onChanged: (val) {
            setState(() {
              dropDownValue2 = val!;
            });
          },
        ),
      ),
    );
  }



  Container sideBarIcon(SideBarController controller) {
    return Container(
      // width: 250,
      width: 70,
      child: Container(
        // color: Color(0xFFFBFAFF),
        decoration: BoxDecoration(
            color: AppColor.backgorundDrawer,
            border: Border(right: BorderSide(color: AppColor.boxborder))),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView(
              children: [
                Container(height: 20),
                SvgPicture.asset(
                  "assets/svg/minia_logo.svg",
                  fit: BoxFit.contain,
                  height: 25,
                  width: 25,
                ),
                Container(height: 30),
                ListTile(
                  // title: Text("home"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/home_non.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Apps"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/grid_box.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Auth"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/auth_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Pages"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/file_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Forms"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/form_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Tables"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .1,
                            offset: Offset.zero,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/table_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded.value = !isExpanded.value;
    });
  }
}

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final int notificationCount;

  const NamedIcon({
    Key? key,
    this.onTap,
    required this.text,
    required this.iconData,
    this.notificationCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 15,
              width: 18,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColor.notired,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  '$notificationCount',
                  style: TextStyle(
                    color: AppColor.mainbackground,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData, color: AppColor.black),
            ],
          ),
        ],
      ),
    );
  }
}

class Gridbutton extends StatelessWidget {
  final String image;
  final String text;

  const Gridbutton({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: 28,
          height: 24,
        ),
        Container(height: 8),
        Text(
          text,
          style: TextStyle(
              fontSize: 13,
              color: AppColor.lightgrey,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class NotifcationsIcon extends StatelessWidget {
  final dynamic icon;
  final String name;
  final String message;
  final String time;

  final Color backgroundColor;

  const NotifcationsIcon({
    super.key,
    required this.icon,
    required this.name,
    required this.message,
    required this.time,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          maxRadius: 15,
          backgroundColor: backgroundColor,
          child: Icon(icon, size: 15, color: AppColor.mainbackground),
        ),
        Container(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF313533)),
            ),
            Container(height: 5),
            Container(
              width: width < 325 ? 190 : 230,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2C302E)),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.watch_later_outlined, size: 15),
                Container(width: 4),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C302E)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Notifcations extends StatelessWidget {
  final dynamic networkImage;
  final String name;
  final String message;
  final String time;
  const Notifcations({
    super.key,
    required this.networkImage,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          height: 30,
          width: 30,
          child: Image.asset(networkImage, fit: BoxFit.cover),
        ), // CircleAvatar(
        //   maxRadius: 15,
        //   backgroundImage: NetworkImage(networkImage),
        // ),
        Container(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF313533)),
            ),
            Container(height: 5),
            Container(
              width: width < 325 ? 190 : 230,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C302E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.watch_later_outlined, size: 15),
                Container(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C302E),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Menu extends StatelessWidget {
  final String text;
  final dynamic color;
  final VoidCallback onTap;
  const Menu({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        // color: Colors.green,
        child: Row(
          children: [
            Container(width: 53),
            Expanded(
              child: Text(
                text.tr,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubMenu extends StatelessWidget {
  final String subtext;
  final dynamic color;
  final VoidCallback onTap;
  const SubMenu({
    super.key,
    required this.subtext,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        // color: Colors.green,
        child: Row(
          children: [
            Container(width: 72),
            Expanded(
              child: Text(
                subtext.tr,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bottomText extends StatelessWidget {
  const bottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        color: AppColor.mainbackground,
        height: 60,
        child: Row(
          children: [
            Container(width: 18),
            Expanded(
              flex: 6,
              child: Text(
                "2024 © Commando.",
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.lightdark),
              ),
            ),
            Spacer(),
            width > 570
                ? Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Design & Develop by ",
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.lightdark),
                      ),
                    ),
                  )
                : Container(),
            width > 570
                ? Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Ridda',
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.selecteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(width: 19),
          ],
        ));
  }
}

class CommanListTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;
  final dynamic selected;
  final dynamic color;
  final double minWidth;
  final bool? isSelected;

  const CommanListTile({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    this.selected,
    required this.color,
    required this.minWidth,
     this.isSelected
  });
  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.find();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: sideBarController.isDashboard.value ? AppColor.selecteColor.withOpacity(0.2) : Colors.transparent,
      ),
      child: ListTile(
        dense: true,
        selectedColor: AppColor.selecteColor,
        title: Text(
          text.tr,
          style: TextStyle(
              overflow: TextOverflow.clip,
              fontSize: 14,

              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
        ),
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(icon,

              size: 20
          )
        ),
        onTap: onTap,
        selected: selected,
      ),
    );
  }
}

class ExpansionListTile extends StatelessWidget {
  final String text;
  final double? minWidth;
  final VoidCallback onTap;
  final dynamic selected;
  final dynamic color;

  ExpansionListTile(
      {super.key,
      required this.text,
      required this.onTap,
      this.selected,
      this.color,
      this.minWidth});

  final SideBarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: minWidth,
      selectedColor: AppColor.selecteColor,
      title: Row(
        children: [
          Container(width: 36),
          Expanded(
            child: Text(
              text.tr,
              style: TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
            ),
          )
        ],
      ),
      onTap: onTap,
      selected: selected,
    );
  }
}

class ExpansionListCustom extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isSeleteed;
  final dynamic selected;
  final dynamic color;
  final dynamic children;
  const ExpansionListCustom({
    super.key,
    required this.title,
    this.selected,
    this.color,
    this.children,
    this.icon,
   required this.isSeleteed, required this.onTap
  });

  @override
  State<ExpansionListCustom> createState() => _ExpansionListCustomState();
}

class _ExpansionListCustomState extends State<ExpansionListCustom> {
  SideBarController controller = Get.find();

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _isExpanded ? AppColor.selecteColor.withOpacity(0.2) : Colors.transparent,
        ),
        child: ListTileTheme(
          dense: true,
          //  data:
          child: Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              onExpansionChanged: (bool isExpanded) {
                controller.isDashboard.value = false;
                setState(() {

                  _isExpanded = isExpanded;
                });

              },
              trailing: _isExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.keyboard_arrow_down,)
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.notselecteColor,
                        size: 12,
                      ),
                    ),
              // collapsedIconColor: AppColor.black,
              textColor: AppColor.searchbackground,
              iconColor: AppColor.searchbackground,
              tilePadding: EdgeInsets.zero,
              title: Text(
                widget.title.tr,
                style: TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 14,
                  //color: _isExpanded ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
              children: widget.children,
              leading: widget.icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 0.0),
                      child: Icon(widget.icon,
                      //color:_isExpanded? Colors.white : AppColor.selecteColor,
                      ),
                    )
                  : Container(width: 0.0),
            ),
          ),
        ),
      ),
    );
  }
}
