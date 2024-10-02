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
  RxBool isUpdating = false.obs;
  Rx<UserListModel> userListModel = UserListModel().obs;
  RxList<UserList> newUserList = <UserList>[].obs;
  RxList<UserList> blockUserList = <UserList>[].obs;
  RxList<UserList> activeUserList = <UserList>[].obs;

  //get all user
  getAllUser(String page)async{
    isLoading.value = true;
    var res = await ApiService().getApi(AppConfig.USER_GET+"?page=$page&limit=10");
    if(res.statusCode == 200){
      activeUserList.value.clear();
      blockUserList.value.clear();
      newUserList.value.clear();
      userListModel.value = UserListModel.fromJson(jsonDecode(res.body));
      for(var i in userListModel.value.data!){
        if(i.status == "active"){
          activeUserList.value.add(i);
        }else if(i.status == "block"){
          blockUserList.value.add(i);
        }else{
          newUserList.value.add(i);
        }
      }
    }
    isLoading.value = false;
  }


  //update user status
  updateUserStatus(id, status)async{
    isUpdating.value = true;
    var data = {
      "status" : status
    };
    var res = await ApiService().putApi(AppConfig.USER_STATUS_UPDATE+"${id}", data);
    if(res.statusCode == 200){
      getAllUser(userListModel.value.currentPage.toString());
      Get.snackbar("Success!", "User status is update. Status: ${status}" ,backgroundColor: Colors.green);
    }else{
      Get.snackbar("Error!", "Something went wrong. Status: ${res.statusCode}", backgroundColor: Colors.red);
    }
    isUpdating.value = false;
  }



}