// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_report_data_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadReportDataResp _$RoadReportDataRespFromJson(Map<String, dynamic> json) {
  return RoadReportDataResp(
    message: json['msg'] as String,
    status: json['status'] as int,
    result: (json['result'] as List<dynamic>)
        .map((e) => RoadReportDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RoadReportDataRespToJson(RoadReportDataResp instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
      'result': instance.result,
    };
