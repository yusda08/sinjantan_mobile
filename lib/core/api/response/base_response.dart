import 'package:sijantan/core/api/response/response_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(createToJson: true)
class BaseResponse extends ResponseObject {
  String message;
  int status;

  BaseResponse({required this.message, required this.status})
      : super(message: message, status: status);

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
