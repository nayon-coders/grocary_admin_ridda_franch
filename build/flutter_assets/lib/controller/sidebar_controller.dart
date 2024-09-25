// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:minia_web_project/view/AdminManagement/screen/add.new.admin.dart';
import 'package:minia_web_project/view/AppSetting/app.pages.dart';
import 'package:minia_web_project/view/AppSetting/site.setting.dart';
import 'package:minia_web_project/view/OrderManagement/screens/accept.orders.dart';
import 'package:minia_web_project/view/OrderManagement/screens/all.orders.screen.dart';
import 'package:minia_web_project/view/OrderManagement/screens/cancel.order.list.dart';
import 'package:minia_web_project/view/OrderManagement/screens/delivery.order.list.dart';
import 'package:minia_web_project/view/OrderManagement/screens/pending.orders.dart';
import 'package:minia_web_project/view/OrderManagement/screens/ready.to.ship.list.dart';
import 'package:minia_web_project/view/ProductManagement/screens/add.category.screen.dart';
import 'package:minia_web_project/view/ProductManagement/screens/add.post.code.dart';
import 'package:minia_web_project/view/ProductManagement/screens/add.product.screen.dart';
import 'package:minia_web_project/view/ProductManagement/screens/all.product.screen.dart';
import 'package:minia_web_project/view/user_management/screen/add.user.dart';
import 'package:minia_web_project/view/user_management/screen/block.user.dart';
import 'package:minia_web_project/view/user_management/screen/new.user.dart';
import 'package:minia_web_project/view/user_management/screen/user_list.dart';
import '../view/AdminManagement/screen/admin.list.dart';
import '../view/OrderManagement/screens/rejected.order.list.dart';
import '../view/dashboard.dart';
import '../view/user_management/controller/user.controller.dart';

class SideBarController extends GetxController {



  RxInt index = 0.obs;

  RxBool isExpanded = true.obs;

  var page = [
    Dashboard(), //0

    //product management
    AllProducts(), //1
    AddNewProduct(), //2
    AddNewCategory(), //3
    AddPostCode(), //4


    //order management
    AllOrderList(), //5
    PendingOrder(), //6
    AcceptOrderScreen(), //7
    ReadyToShipOrderList(), //8
    DeliveryOrderList(), //9
    CancelOrderList(), //10
    RejectedOrderList(), //11


    //user management
    AddNewUser(), //12
    UserListScreen(), //13
    PendingUser(), //14
    AddBlockUser(), //15


    //admin
    AddNewAdmin(), //16
    AdminList(), //17

    //setting
    SiteSetting(), //18
    SettingPages(), //19

  ];




  expandOrShrinkDrawer(){
    isExpanded.value = !isExpanded.value;
  }

}

// Editors(), //20