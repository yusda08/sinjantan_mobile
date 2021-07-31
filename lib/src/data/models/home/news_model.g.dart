// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    newsId: json['news_id'] as String,
    newsTitle: json['news_judul'] as String,
    newsContent: json['news_ket'] as String,
    newsDate: DateTime.parse(json['news_tgl'] as String),
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'news_id': instance.newsId,
      'news_judul': instance.newsTitle,
      'news_ket': instance.newsContent,
      'news_tgl': instance.newsDate.toIso8601String(),
    };
