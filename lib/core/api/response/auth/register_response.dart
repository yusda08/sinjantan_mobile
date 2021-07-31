import 'package:json_annotation/json_annotation.dart';

import '../response_object.dart';

part 'register_response.g.dart';

@JsonSerializable(createToJson: true)
class RegisterResponse extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  RegisterResponse({
    required this.message,
    required this.status,
  }) : super(message: message, status: status);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  static get serializer => _$RegisterResponseFromJson;

  Map toJson() {
    return _$RegisterResponseToJson(this);
  }
}
