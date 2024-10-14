
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/data/global/global_variable.dart';
import 'package:minia_web_project/main.dart';
import 'package:minia_web_project/view/AdminManagement/screen/add.new.admin.dart';
import 'package:minia_web_project/view/AppSetting/app.pages.dart';
import 'package:minia_web_project/view/AppSetting/site.setting.dart';
import 'package:minia_web_project/view/OrderManagement/screens/enprepartion.dart';
import 'package:minia_web_project/view/OrderManagement/screens/all.orders.screen.dart';
import 'package:minia_web_project/view/OrderManagement/screens/cancel.order.list.dart';
import 'package:minia_web_project/view/OrderManagement/screens/delivery.order.list.dart';
import 'package:minia_web_project/view/OrderManagement/screens/pending.orders.dart';
import 'package:minia_web_project/view/OrderManagement/screens/ready.to.ship.list.dart';
import 'package:minia_web_project/view/ProductManagement/screens/add.category.screen.dart';
import 'package:minia_web_project/view/ProductManagement/screens/add.post.code.dart';
import 'package:minia_web_project/view/ProductManagement/screens/add.product.screen.dart';
import 'package:minia_web_project/view/ProductManagement/screens/all.product.screen.dart';
import 'package:minia_web_project/view/user_management/screen/active.user.dart';
import 'package:minia_web_project/view/user_management/screen/add.user.dart';
import 'package:minia_web_project/view/user_management/screen/block.user.dart';
import 'package:minia_web_project/view/user_management/screen/new.user.dart';
import 'package:minia_web_project/view/user_management/screen/user_list.dart';
import '../view/AdminManagement/screen/admin.list.dart';
import '../view/Authentication/controller/login.controller.dart';
import '../view/OrderManagement/screens/termine.order.list.dart';
import '../view/dashboard/screen/dashboard.dart';
import '../view/user_management/controller/user.controller.dart';
class SideBarController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.find<LoginController>().getMyProfile();
    assignPagesBasedOnRole();
  }

  RxInt index = 0.obs;
  RxBool isExpanded = true.obs;
  RxBool isDashboard = true.obs;


  // Dynamically assign pages based on the user's role
  List<dynamic> page = [];

  void assignPagesBasedOnRole() {
    // Ensure the list is cleared before assigning new pages
    page.clear();

    print("befor role === ${sharedPreferences!.getString("role")}");

    // Helper function to ensure the list is long enough for a specific index
    void ensureLength(int index) {
      if (page.length <= index) {
        page.addAll(List.filled(index - page.length + 1, Container()));
      }
    }

    print("before call  GlobalVariable.adminProfile.value.roleName.toString() ${GlobalVariable.adminProfile.value.roleName.toString()}");

    switch (sharedPreferences!.getString("role")) {
      case 'SuperAdmin':
      // Ensure length before inserting at each index
        ensureLength(0);
        page[0] = Dashboard();
        ensureLength(1);
        page[1] = AllProducts();
        ensureLength(2);
        page[2] = AddNewProduct();
        ensureLength(3);
        page[3] = AddNewCategory();
        ensureLength(4);
        page[4] = AddPostCode();
        ensureLength(5);
        page[5] = AllOrderList();
        ensureLength(6);
        page[6] = PendingOrder();
        ensureLength(7);
        page[7] = AcceptOrderScreen();
        ensureLength(8);
        page[8] = ReadyToShipOrderList();
        ensureLength(9);
        page[9] = DeliveryOrderList();
        ensureLength(10);
        page[10] = CancelOrderList();
        ensureLength(11);
        page[11] = CompleteOrderList();
        ensureLength(12);
        page[12] = AddNewUser();
        ensureLength(13);
        page[13] = PendingUser();
        ensureLength(14);
        page[14] = ActiveUser();
        ensureLength(15);
        page[15] = BlockUser();
        ensureLength(16);
        page[16] = AddNewAdmin();
        ensureLength(17);
        page[17] = AdminList();
        ensureLength(18);
        page[18] = SiteSetting();
        ensureLength(19);
        page[19] = SettingPages();
        break;

      case 'Admin':
        ensureLength(0);
        page[0] = Dashboard();
        ensureLength(1);
        page[1] = AllProducts();
        ensureLength(2);
        page[2] = AddNewProduct();
        ensureLength(3);
        page[3] = AddNewCategory();
        ensureLength(4);
        page[4] = AddPostCode();
        ensureLength(5);
        page[5] = AllOrderList();
        ensureLength(6);
        page[6] = PendingOrder();
        ensureLength(7);
        page[7] = AcceptOrderScreen();
        ensureLength(8);
        page[8] = ReadyToShipOrderList();
        ensureLength(9);
        page[9] = DeliveryOrderList();
        ensureLength(10);
        page[10] = CancelOrderList();
        ensureLength(11);
        page[11] = CompleteOrderList();
        ensureLength(12);
        page[12] = AddNewUser();
        ensureLength(13);
        page[13] = PendingUser();
        ensureLength(14);
        page[14] = ActiveUser();
        ensureLength(15);
        page[15] = BlockUser();
        ensureLength(17); // skipping index 16, as no element is inserted there
        page[17] = AdminList();
        ensureLength(18);
        page[18] = SiteSetting();
        ensureLength(19);
        page[19] = SettingPages();
        break;

      case 'Acheteur':
        ensureLength(0);
        page[0] = Dashboard();
        ensureLength(1);
        page[1] = AllProducts();
        ensureLength(2);
        page[2] = AddNewProduct();
        ensureLength(3);
        page[3] = AddNewCategory();
        ensureLength(4);
        page[4] = AddPostCode();
        break;

      case 'Préparateur':
        ensureLength(0);
        page[0] = Dashboard();
        ensureLength(12);
        page[12] = AddNewUser();
        ensureLength(13);
        page[13] = PendingUser();
        ensureLength(14);
        page[14] = ActiveUser();
        ensureLength(15);
        page[15] = BlockUser();
        break;

      case 'Livreur':
        ensureLength(0);
        page[0] = Dashboard();
        break;

      case 'Compta':
        ensureLength(0);
        page[0] = Dashboard();
        ensureLength(18);
        page[18] = SiteSetting();
        ensureLength(19);
        page[19] = SettingPages();
        break;

      case 'Commercial':
        ensureLength(0);
        page[0] = Dashboard();
        ensureLength(5);
        page[5] = AllOrderList();
        ensureLength(6);
        page[6] = PendingOrder();
        ensureLength(7);
        page[7] = AcceptOrderScreen();
        ensureLength(8);
        page[8] = ReadyToShipOrderList();
        ensureLength(9);
        page[9] = DeliveryOrderList();
        ensureLength(10);
        page[10] = CancelOrderList();
        break;

      default:
        ensureLength(0);
        page[0] = Dashboard();
        break;
    }

    print("Assigned pages: ${page.length}");
    print("Assigned pages: ${page}");
  }


  // Method to check permissions based on role
  bool hasPermission(int pageIndex) {
    switch (sharedPreferences!.getString("role")) {
      case 'SuperAdmin':
        return true; // SuperAdmin has access to everything
      case 'Admin':
        return true; // Admins have access up to index 17 (no access to higher pages like SiteSettings)
      case 'Acheteur':
        return pageIndex < 5; // Acheteur can access up to product-related pages
      case 'Préparateur':
        return (pageIndex >= 12 && pageIndex <= 15); // Préparateur can access order management pages
      case 'Livreur':
        return pageIndex == 0; // Livreur only has access to the dashboard
      case 'Compta':
        return pageIndex == 0 || pageIndex == 18 || pageIndex == 19; // Compta can access dashboard and settings
      case 'Commercial':
        return pageIndex < 13; // Commercial can access order and user management
      default:
        return false; // Default to no access
    }
  }

  // Expand or shrink the drawer
  void expandOrShrinkDrawer() {
    isExpanded.value = !isExpanded.value;
  }
}



// // ignore_for_file: prefer_const_constructors
//
// import 'package:get/get.dart';
// import 'package:minia_web_project/data/global/global_variable.dart';
// import 'package:minia_web_project/view/AdminManagement/screen/add.new.admin.dart';
// import 'package:minia_web_project/view/AppSetting/app.pages.dart';
// import 'package:minia_web_project/view/AppSetting/site.setting.dart';
// import 'package:minia_web_project/view/OrderManagement/screens/enprepartion.dart';
// import 'package:minia_web_project/view/OrderManagement/screens/all.orders.screen.dart';
// import 'package:minia_web_project/view/OrderManagement/screens/cancel.order.list.dart';
// import 'package:minia_web_project/view/OrderManagement/screens/delivery.order.list.dart';
// import 'package:minia_web_project/view/OrderManagement/screens/pending.orders.dart';
// import 'package:minia_web_project/view/OrderManagement/screens/ready.to.ship.list.dart';
// import 'package:minia_web_project/view/ProductManagement/screens/add.category.screen.dart';
// import 'package:minia_web_project/view/ProductManagement/screens/add.post.code.dart';
// import 'package:minia_web_project/view/ProductManagement/screens/add.product.screen.dart';
// import 'package:minia_web_project/view/ProductManagement/screens/all.product.screen.dart';
// import 'package:minia_web_project/view/user_management/screen/active.user.dart';
// import 'package:minia_web_project/view/user_management/screen/add.user.dart';
// import 'package:minia_web_project/view/user_management/screen/block.user.dart';
// import 'package:minia_web_project/view/user_management/screen/new.user.dart';
// import 'package:minia_web_project/view/user_management/screen/user_list.dart';
// import '../view/AdminManagement/screen/admin.list.dart';
// import '../view/Authentication/controller/login.controller.dart';
// import '../view/OrderManagement/screens/termine.order.list.dart';
// import '../view/dashboard/screen/dashboard.dart';
// import '../view/user_management/controller/user.controller.dart';

// class SideBarController extends GetxController {
//
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//
//   }
//
//
//   RxInt index = 0.obs;
//
//   RxBool isExpanded = true.obs;
//
//   RxBool isDashboard = true.obs;
//
//   String role()=> GlobalVariable.adminProfile.value.roleName.toString();
//
//
//   var page = [
//     Dashboard(), //0
//     AllProducts(), //1
//     AllProducts(), //2
//     //product management
//
//     AddNewProduct(), //2
//     AddNewCategory(), //3
//     AddPostCode(), //4
//
//
//     //order management
//     AllOrderList(), //5
//     PendingOrder(), //6
//     AcceptOrderScreen(), //7
//     ReadyToShipOrderList(), //8
//     DeliveryOrderList(), //9
//     CancelOrderList(), //10
//     RejectedOrderList(), //11
//
//
//     //user management
//     AddNewUser(), //12
//     PendingUser(), //13
//     ActiveUser(), //14
//
//     BlockUser(), //15
//
//
//     //admin
//     AddNewAdmin(), //16
//     AdminList(), //17
//
//     //setting
//     SiteSetting(), //18
//     SettingPages(), //19
//
//   ];
//
//
//
//
//   expandOrShrinkDrawer(){
//     isExpanded.value = !isExpanded.value;
//   }
//
// }
//
// // Editors(), //20