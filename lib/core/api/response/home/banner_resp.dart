import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/home/banner_model.dart';

import '../response_object.dart';

part 'banner_resp.g.dart';

@JsonSerializable()
class BannerResp extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final List<BannerModel> result;

  BannerResp({
    required this.message,
    required this.status,
    required this.result,
  }) : super(message: message, status: status);

  factory BannerResp.fromJson(Map<String, dynamic> json) =>
      _$BannerRespFromJson(json);

  Map<String, dynamic> toJson() => _$BannerRespToJson(this);

  static get serializer => _$BannerRespFromJson;
}
