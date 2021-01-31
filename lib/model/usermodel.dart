// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.photoPath,
    this.phone,
    this.address,
    this.roleFlag,
    this.prohibitionFlag,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String photoPath;
  String phone;
  String address;
  int roleFlag;
  int prohibitionFlag;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        photoPath: json["photo_path"],
        phone: json["phone"],
        address: json["address"],
        roleFlag: json["role_flag"],
        prohibitionFlag: json["prohibition_flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "photo_path": photoPath,
        "phone": phone,
        "address": address,
        "role_flag": roleFlag,
        "prohibition_flag": prohibitionFlag,
      };
}
