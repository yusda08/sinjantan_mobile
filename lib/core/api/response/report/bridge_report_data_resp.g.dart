// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_report_data_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BridgeReportDataResp _$BridgeReportDataRespFromJson(Map<String, dynamic> json) {
  return BridgeReportDataResp(
    message: json['msg'] as String,
    status: json['status'] as int,
    result: (json['result'] as List<dynamic>)
        .map((e) => BridgeReportDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BridgeReportDataRespToJson(
        BridgeReportDataResp instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
      'result': instance.result,
    };
