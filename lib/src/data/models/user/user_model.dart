import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class UserModel {
  UserModel({
    required this.kdUser,
    required this.kdLevel,
    required this.username,
    required this.password,
    required this.namaUser,
    required this.email,
    required this.noTelpon,
    required this.foto,
    required this.isActive,
    required this.token,
  });

  @HiveField(0)
  final String kdUser;
  @HiveField(1)
  final String kdLevel;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String namaUser;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String noTelpon;
  @HiveField(7)
  final String foto;
  @HiveField(8)
  final String isActive;
  @HiveField(9)
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        kdUser: json["kd_user"],
        kdLevel: json["kd_level"],
        username: json["username"],
        password: json["password"],
        namaUser: json["nama_user"],
        email: json["email"],
        noTelpon: json["no_telpon"],
        foto: json["foto"],
        isActive: json["is_active"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "kd_user": kdUser,
        "kd_level": kdLevel,
        "username": username,
        "password": password,
        "nama_user": namaUser,
        "email": email,
        "no_telpon": noTelpon,
        "foto": foto,
        "is_active": isActive,
        "token": token,
      };
}


