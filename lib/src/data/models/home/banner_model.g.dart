// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    bannerId: json['banner_id'] as String,
    bannerTitle: json['banner_judul'] as String,
    bannerContent: json['banner_ket'] as String,
    fotoPath: json['foto_path'] as String,
    fotoName: json['foto_name'] as String,
    createAt: DateTime.parse(json['create_at'] as String),
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'banner_id': instance.bannerId,
      'banner_judul': instance.bannerTitle,
      'banner_ket': instance.bannerContent,
      'foto_path': instance.fotoPath,
      'foto_name': instance.fotoName,
      'create_at': instance.createAt.toIso8601String(),
    };
