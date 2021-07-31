// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportAsset _$ReportAssetFromJson(Map<String, dynamic> json) {
  return ReportAsset(
    reportAssetId: json['id_asset'] as String,
    lat: json['lat'] as String,
    long: json['long'] as String,
    photoPath: json['foto_path'] as String,
    photoName: json['foto_name'] as String,
    photoNameThumb: json['foto_name_thumb'] as String,
  );
}

Map<String, dynamic> _$ReportAssetToJson(ReportAsset instance) =>
    <String, dynamic>{
      'id_asset': instance.reportAssetId,
      'lat': instance.lat,
      'long': instance.long,
      'foto_path': instance.photoPath,
      'foto_name': instance.photoName,
      'foto_name_thumb': instance.photoNameThumb,
    };
