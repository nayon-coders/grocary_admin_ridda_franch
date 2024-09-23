import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/app.config.dart';
import 'package:minia_web_project/data/model/user.list.model.dart';
import 'package:minia_web_project/data/service/api.service.dart';

class AppUserController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  @override
  void onReady() {
    // TODO: implement onClose
    super.onReady();
  }



  RxBool isLoading = false.obs;
  Rx<UserListModel> userListModel = UserListModel().obs;


  //get user list
  getUserList()async{
    isLoading.value = true;
    var res = await ApiService().getApi(AppConfig.ALL_USERS);
    userListModel.value = UserListModel.fromJson(jsonDecode(res.body));
    isLoading.value = false;
  }

}