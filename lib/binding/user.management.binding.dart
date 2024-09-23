import 'package:get/get.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/view/Authentication/controller/login.controller.dart';
import 'package:minia_web_project/view/user_management/controller/user.controller.dart';

class UserManagementBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<AppUserController>(()=>AppUserController());
  }



}