// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BridgeReportDataModel _$BridgeReportDataModelFromJson(
    Map<String, dynamic> json) {
  return BridgeReportDataModel(
    reportTicket: json['tiket_kode'] as String,
    bridgeName: json['jembatan_nama'] as String,
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

Map<String, dynamic> _$BridgeReportDataModelToJson(
        BridgeReportDataModel instance) =>
    <String, dynamic>{
      'tiket_kode': instance.reportTicket,
      'jembatan_nama': instance.bridgeName,
      'kd_user': instance.userCode,
      'pengadu_nama': instance.userName,
      'pengadu_no_hp': instance.userPhoneNumber,
      'pengadu_ket': instance.reportText,
      'pengadu_tgl': instance.reportDate.toIso8601String(),
      'status_respon': instance.responseStatus,
      'asset': instance.reportAssets,
      'respon': instance.reportResponse,
    };
