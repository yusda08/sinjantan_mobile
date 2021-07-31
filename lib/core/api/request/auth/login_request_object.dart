import 'package:json_annotation/json_annotation.dart';

import '../request_object.dart';

part 'login_request_object.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequestObject implements RequestObject {
  @JsonKey(name: 'username')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  const LoginRequestObject({
    required this.email,
    required this.password,
  });

  Map getJsonBody() {
    return _$LoginRequestObjectToJson(this);
  }
}
