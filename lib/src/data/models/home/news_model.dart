import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  NewsModel({
    required this.newsId,
    required this.newsTitle,
    required this.newsContent,
    required this.newsDate,
  });

  @JsonKey(name: 'news_id')
  final String newsId;
  @JsonKey(name: 'news_judul')
  final String newsTitle;
  @JsonKey(name: 'news_ket')
  final String newsContent;
  @JsonKey(name: 'news_tgl')
  final DateTime newsDate;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
