import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/app.config.dart';
import 'package:minia_web_project/data/service/api.service.dart';

import '../../../data/model/privacy_model.dart';

class SettingControleler extends GetxController{

  onInit(){
    getPrivacy();
    super.onInit();
  }

  //text edting controller
  Rx<TextEditingController> terms = TextEditingController().obs;
  Rx<TextEditingController> privacy = TextEditingController().obs;
  Rx<TextEditingController> aboutUs = TextEditingController().obs;
  Rx<TextEditingController> legal = TextEditingController().obs;
  Rx<TextEditingController> oldPass = TextEditingController().obs;
  Rx<TextEditingController> newPass = TextEditingController().obs;

  //privacy model
  var privacyModel = PrivacyModel().obs;
  
  //bool 
  var isGettingPrivacy = false.obs;
  var isUpdatePass = false.obs;

  //get privacy
  getPrivacy()async{
    isGettingPrivacy.value = true;
    //get privacy model
    var res = await ApiService().getApi(AppConfig.PRIVACY_GET);
    if(res.statusCode == 200){
      privacyModel.value = privacyModelFromJson(res.body);
      terms.value.text = privacyModel.value.data!.terms!;
      privacy.value.text = privacyModel.value.data!.privacy!;
      aboutUs.value.text = privacyModel.value.data!.aboutUs!;
      legal.value.text = privacyModel.value.data!.legal!;
    }
    isGettingPrivacy.value = false;
  }

  //update privacy
  updatePrivacy()async{
    isGettingPrivacy.value = true;
    //get privacy model
    var res = await ApiService().putApi(AppConfig.PRIVACY_GET, {
        "privacy": privacy.value.text,
        "terms": terms.value.text,
        "about_us": aboutUs.value.text,
        "legal": legal.value.text
    });
    if(res.statusCode == 200){
      getPrivacy();
      Get.snackbar("Success", "Privacy Updated", snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
    }
  }


  //CHANGE ADMINPASSWORD
  changeAdminPassword()async{
    isUpdatePass.value = true;
    //get privacy model
    var res = await ApiService().putApi(AppConfig.ADMIN_PASSWORD, {
      "old_password": oldPass.value.text,
      "new_password": newPass.value.text,
    });
    if(res.statusCode == 200){
      Get.snackbar("Success", "Password Updated", snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
      oldPass.value.clear();
      newPass.value.clear();
    }else{
      Get.snackbar("Error", "${jsonDecode(res.body)["error"]}", snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
    isUpdatePass.value = false;
  }


}