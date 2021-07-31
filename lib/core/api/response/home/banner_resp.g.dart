// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResp _$BannerRespFromJson(Map<String, dynamic> json) {
  return BannerResp(
    message: json['msg'] as String,
    status: json['status'] as int,
    result: (json['result'] as List<dynamic>)
        .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BannerRespToJson(BannerResp instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
      'result': instance.result,
    };
