import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/user/user_model.dart';
import '../response_object.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: true)
class LoginResponse extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final UserModel userData;

  LoginResponse({
    required this.message,
    required this.status,
    required this.userData,
  }):super(message: message, status: status);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  static get serializer => _$LoginResponseFromJson;

  Map toJson() {
    return _$LoginResponseToJson(this);
  }
}
