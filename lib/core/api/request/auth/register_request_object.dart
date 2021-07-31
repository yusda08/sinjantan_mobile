import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../request_object.dart';

part 'register_request_object.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestObject implements RequestObject {
  @JsonKey(name: 'no_telpon')
  final String phoneNumber;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'nama')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  const RegisterRequestObject({
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.email,
  });

  Map getJsonBody() {
    return _$RegisterRequestObjectToJson(this);
  }
}
