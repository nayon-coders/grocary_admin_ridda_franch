import 'package:get/get.dart';

class ProductController extends GetxController{

  RxString test = "Yes its binding".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("yes its bin -- ${test}");
  }


}