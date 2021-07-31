// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResp _$NewsRespFromJson(Map<String, dynamic> json) {
  return NewsResp(
    message: json['msg'] as String,
    status: json['status'] as int,
    result: (json['result'] as List<dynamic>)
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NewsRespToJson(NewsResp instance) => <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
      'result': instance.result,
    };
