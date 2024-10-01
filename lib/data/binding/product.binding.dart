import 'package:get/get.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/view/Authentication/controller/login.controller.dart';
import 'package:minia_web_project/view/ProductManagement/controller/product.controller.dart';

import '../../view/ProductManagement/controller/postcode.controller.dart';
import '../../view/user_management/controller/user.controller.dart';


class ProductBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<ProductController>(()=>ProductController());
    Get.lazyPut<PostCodeController>(()=>PostCodeController());
  }



}