import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sijantan/core/api/response/response_object.dart';
import 'package:sijantan/src/data/models/user/user_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseRespModel extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;
  @JsonKey(name: 'status')
  final int status;

  BaseRespModel({
    required this.message,
    required this.status,
  }) : super(message: message, status: status);

  factory BaseRespModel.fromJson(Map<String, dynamic> json) =>
      _$BaseRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRespModelToJson(this);

  static get serializer => _$BaseRespModelFromJson;
}

T _dataFromJson<T>(Map<String, dynamic> input) {
  if (T.toString() == (UserModel).toString()) {
    return UserModel.fromJson(input) as T;
  }
  throw Exception('parsing exception');
}

Map<String, dynamic> _dataToJson<T>(T input) => {'data': input};
