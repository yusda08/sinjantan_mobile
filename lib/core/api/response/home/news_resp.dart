import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/home/news_model.dart';

import '../response_object.dart';

part 'news_resp.g.dart';

@JsonSerializable()
class NewsResp extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final List<NewsModel> result;

  NewsResp({
    required this.message,
    required this.status,
    required this.result,
  }) : super(message: message, status: status);

  factory NewsResp.fromJson(Map<String, dynamic> json) =>
      _$NewsRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewsRespToJson(this);

  static get serializer => _$NewsRespFromJson;
}
