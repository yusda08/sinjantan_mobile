// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadReportDataModel _$RoadReportDataModelFromJson(Map<String, dynamic> json) {
  return RoadReportDataModel(
    reportTicket: json['tiket_kode'] as String,
    roadName: json['jalan_nama'] as String,
    userCode: json['kd_user'] as String,
    userName: json['pengadu_nama'] as String,
    userPhoneNumber: json['pengadu_no_hp'] as String,
    reportText: json['pengadu_ket'] as String,
    reportDate: DateTime.parse(json['pengadu_tgl'] as String),
    responseStatus: json['status_respon'] as String,
    reportAssets: (json['asset'] as List<dynamic>)
        .map((e) => ReportAsset.fromJson(e as Map<String, dynamic>))
        .toList(),
    reportResponse: (json['respon'] as List<dynamic>)
        .map((e) => ReportResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RoadReportDataModelToJson(
        RoadReportDataModel instance) =>
    <String, dynamic>{
      'tiket_kode': instance.reportTicket,
      'jalan_nama': instance.roadName,
      'kd_user': instance.userCode,
      'pengadu_nama': instance.userName,
      'pengadu_no_hp': instance.userPhoneNumber,
      'pengadu_ket': instance.reportText,
      'pengadu_tgl': instance.reportDate.toIso8601String(),
      'status_respon': instance.responseStatus,
      'asset': instance.reportAssets,
      'respon': instance.reportResponse,
    };
