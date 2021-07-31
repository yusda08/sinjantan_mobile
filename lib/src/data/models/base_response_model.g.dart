// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRespModel _$BaseRespModelFromJson(Map<String, dynamic> json) {
  return BaseRespModel(
    message: json['msg'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$BaseRespModelToJson(BaseRespModel instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
    };
