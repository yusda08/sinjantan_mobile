// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) {
  return ReportResponse(
    responseText: json['respon_ket'] as String,
    responseDate: DateTime.parse(json['respon_tgl'] as String),
  );
}

Map<String, dynamic> _$ReportResponseToJson(ReportResponse instance) =>
    <String, dynamic>{
      'respon_ket': instance.responseText,
      'respon_tgl': instance.responseDate.toIso8601String(),
    };
