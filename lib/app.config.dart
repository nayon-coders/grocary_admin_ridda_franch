import 'package:flutter/material.dart';

class AppConfig{


  static const String DOMAIN_URL = "https://w3coins.onrender.com";
  static const String API = "api/v1";
  static const String BASE_URL = "$DOMAIN_URL/$API";

  static const String LOGIN = "$BASE_URL/admin/login";
  static const String ADMIN_INFO = "$BASE_URL/admin/me";
  static const String ALL_USERS = "$BASE_URL/users/all";
  static const String COIN_PRICE = "$BASE_URL/dashboard/coin-price";
  static const String TOTAL_COIN = "$BASE_URL/dashboard/total-coins";
  static const String UPDATE_COIN_PRICE = "$BASE_URL/dashboard/coin-price";

}