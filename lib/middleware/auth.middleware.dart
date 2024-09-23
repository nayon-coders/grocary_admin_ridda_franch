import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/routes/app_pages.dart';
import 'package:minia_web_project/routes/pages.dart';
import '../main.dart';
class AuthMiddleware extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getString("token") != null) return RouteSettings(name: AppRoute.login);
    //return RouteSettings(name: AppRouting.login);
  }

}