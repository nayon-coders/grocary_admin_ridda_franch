import 'package:get/get.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/view/Authentication/controller/login.controller.dart';

import '../view/user_management/controller/user.controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<SideBarController>(()=>SideBarController());
    Get.lazyPut<LoginController>(()=>LoginController());
    Get.lazyPut<AppUserController>(()=>AppUserController());
  }



}