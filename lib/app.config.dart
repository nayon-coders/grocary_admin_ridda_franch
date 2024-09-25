import 'package:flutter/material.dart';

class AppConfig{


  static const String DOMAIN_URL = "https://w3coins.onrender.com";
  static const String API = "api/v1";
  static const String BASE_URL = "$DOMAIN_URL/$API";

  static const String LOGIN = "$BASE_URL/admin/login";

  //product
  static const String PRODUCT_GET = "$BASE_URL/product/all";
  static const String PRODUCT_ADD = "$BASE_URL/product/create";
  static const String PRODUCT_UPDATE = "$BASE_URL/product/update/";
  static const String PRODUCT_DELETE = "$BASE_URL/product/delete/";
  static const String PRODUCT_SINGLE = "$BASE_URL/product/";
  static const String POST_CODER_CREATE = "$BASE_URL/product/post-code";
  static const String POST_CODE_DELETE = "$BASE_URL/product/post-code/";
  static const String POST_CODE_GET = "$BASE_URL/product/post-code";


}