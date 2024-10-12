// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:get/get.dart';
import 'package:minia_web_project/main.dart';
import 'package:minia_web_project/middleware/auth.middleware.dart';
import 'package:minia_web_project/routes/app_routes.dart';
import 'package:minia_web_project/routes/pages.dart';
import 'package:minia_web_project/view/Authentication/controller/login.controller.dart';
import 'package:minia_web_project/view/Authentication/pages/reset_pass.dart';
import 'package:minia_web_project/view/user_management/controller/user.controller.dart';
import 'package:minia_web_project/view/user_management/screen/user_list.dart';
import '../view/Authentication/pages/log_out.dart';
import '../view/Authentication/pages/login.dart';
import '../view/Menus/drawer.dart';

class AppPages {
  AppPages._();


  static final routes = [
    GetPage(
      name: Paths.myApp,
      page: () =>  MyApp(),
    ),
    GetPage(
      name: AppRoute.sidebar,
      page: () => const SideBarPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),


    ),
    GetPage(
      name: AppRoute.login,
      page: () =>  Login(),
        middlewares: [AuthMiddleware()]
    ),

    GetPage(
      name: AppRoute.USER_LIST_SCREEN,
      page: () =>  UserListScreen(),
    ),








    //----------------------------//
    GetPage(
      name: Paths.resetPassword,
      page: () => const ResetPassword(),
    ),

    GetPage(
      name: Paths.logout,
      page: () => const Logout(),
    ),

  ];
}
