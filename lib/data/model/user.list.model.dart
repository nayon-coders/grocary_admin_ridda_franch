// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  final bool? success;
  final String? message;
  final int? totalUsers;
  final int? currentPage;
  final int? totalPages;
  final List<Datum>? data;

  UserListModel({
    this.success,
    this.message,
    this.totalUsers,
    this.currentPage,
    this.totalPages,
    this.data,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    success: json["success"],
    message: json["message"],
    totalUsers: json["totalUsers"],
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalUsers": totalUsers,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? walletNumber;
  final String? ownRefercode;
  final String? refercode;
  final String? signupmethod;
  final String? phone;
  final String? profileImage;
  final String? nidImage;
  final int? accountStatus;
  final int? verifyStatus;
  final String? kycStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.email,
    this.password,
    this.walletNumber,
    this.ownRefercode,
    this.refercode,
    this.signupmethod,
    this.phone,
    this.profileImage,
    this.nidImage,
    this.accountStatus,
    this.verifyStatus,
    this.kycStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    walletNumber: json["walletNumber"],
    ownRefercode: json["own_refercode"],
    refercode: json["refercode"],
    signupmethod: json["signupmethod"],
    phone: json["phone"],
    profileImage: json["profile_image"],
    nidImage: json["nid_image"],
    accountStatus: json["account_status"],
    verifyStatus: json["verify_status"],
    kycStatus: json["kyc_status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "walletNumber": walletNumber,
    "own_refercode": ownRefercode,
    "refercode": refercode,
    "signupmethod": signupmethod,
    "phone": phone,
    "profile_image": profileImage,
    "nid_image": nidImage,
    "account_status": accountStatus,
    "verify_status": verifyStatus,
    "kyc_status": kycStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
