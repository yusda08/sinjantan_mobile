// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadDataResponse _$RoadDataResponseFromJson(Map<String, dynamic> json) {
  return RoadDataResponse(
    message: json['msg'] as String,
    status: json['status'] as int,
    result: (json['result'] as List<dynamic>)
        .map((e) => RoadModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RoadDataResponseToJson(RoadDataResponse instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
      'result': instance.result,
    };
