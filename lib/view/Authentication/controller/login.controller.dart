// ignore_for_file: unnecessary_overrides, unused_element

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:minia_web_project/data/global/global_variable.dart';
import 'package:minia_web_project/data/service/api.service.dart';
import 'package:minia_web_project/routes/app_pages.dart';
import 'package:minia_web_project/routes/pages.dart';

import '../../../app.config.dart';
import '../../../data/model/admin_profile_model.dart';
import '../../../main.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _status = Rx<RxStatus>(RxStatus.empty());

  RxBool isShow = true.obs;
  RxBool login = true.obs;
  RxBool isLoading = false.obs;
  RxBool valuefirst = true.obs;

  RxStatus get status => _status.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
  }

  bool _isValid() {
    if (nameController.text.trim().isEmpty) {
      return false;
    }
    return true;
  }

  void checkBoxValue(value){
    valuefirst.value = value!;
  }

  Rx<AdminProfileModel> myprofiel = AdminProfileModel().obs;


  //login with api
  Future adminLogin(String email, String pass)async{
    isLoading.value = true;
    var response = await http.post(Uri.parse(AppConfig.LOGIN,),
        body: jsonEncode(
            {
              "email": email,
              "password": pass
            }
        ),
        headers: {
          "Content-Type" : "application/json"
        }
    );

    var data = jsonDecode(response.body);

    if(response.statusCode == 200){

      sharedPreferences?.setString("token", data["data"]["token"].toString());

       await getMyProfile();
      if(sharedPreferences!.getString("role") != null){
        print("account role it ---- ${sharedPreferences!.getString("role")}");
        Get.snackbar("Login Success!", "Welcome to Admin Panel");
        Get.toNamed(AppRoute.sidebar);
      }

    }else{
      Get.snackbar("Login Failed", "${data["error"]}");
    }
    isLoading.value = false;
  }


  //get my profile
  RxBool isGettingMyProfile = false.obs;
  Future getMyProfile()async{
    isGettingMyProfile.value = true;
    var response = await ApiService().getApi(AppConfig.MY_PROFILE);

    var data = jsonDecode(response.body);

    if(response.statusCode == 200){
     sharedPreferences!.setString("role", data["role_name"]);
     myprofiel.value = AdminProfileModel.fromJson(data);
    }
    isGettingMyProfile.value = false;

    return isGettingMyProfile.value;
  }

}



//
// // ignore_for_file: unnecessary_overrides, unused_element
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:minia_web_project/data/global/global_variable.dart';
// import 'package:minia_web_project/data/service/api.service.dart';
// import 'package:minia_web_project/routes/app_pages.dart';
// import 'package:minia_web_project/routes/pages.dart';
//
// import '../../../app.config.dart';
// import '../../../data/model/admin_profile_model.dart';
// import '../../../main.dart';
//
// class LoginController extends GetxController {
//   final nameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _status = Rx<RxStatus>(RxStatus.empty());
//
//   RxBool isShow = true.obs;
//   RxBool login = true.obs;
//   RxBool isLoading = false.obs;
//   RxBool valuefirst = true.obs;
//
//   RxStatus get status => _status.value;
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     nameController.dispose();
//     passwordController.dispose();
//   }
//
//   bool _isValid() {
//     if (nameController.text.trim().isEmpty) {
//       return false;
//     }
//     return true;
//   }
//
//   void checkBoxValue(value){
//     valuefirst.value = value!;
//   }
//
//
//   //login with api
//   Future adminLogin(String email, String pass)async{
//     isLoading.value = true;
//     var response = await http.post(Uri.parse(AppConfig.LOGIN,),
//         body: jsonEncode(
//             {
//               "email": email,
//               "password": pass
//             }
//         ),
//         headers: {
//           "Content-Type" : "application/json"
//         }
//     );
//
//     var data = jsonDecode(response.body);
//
//     if(response.statusCode == 200){
//
//       sharedPreferences?.setString("token", data["data"]["token"].toString());
//       Get.snackbar("Login Success!", "Welcome to Admin Panel");
//
//       Get.toNamed(AppRoute.sidebar);
//     }else{
//       Get.snackbar("Login Failed", "${data["error"]}");
//     }
//     isLoading.value = false;
//   }
//
//
//   //get my profile
//   Future getMyProfile()async{
//     isLoading.value = true;
//     var response = await ApiService().getApi(AppConfig.MY_PROFILE);
//
//     var data = jsonDecode(response.body);
//
//     if(response.statusCode == 200){
//       GlobalVariable.adminProfile.value = AdminProfileModel.fromJson(data);
//     }else{
//       Get.snackbar("Failed", "${data["error"]}");
//     }
//     isLoading.value = false;
//   }
// }