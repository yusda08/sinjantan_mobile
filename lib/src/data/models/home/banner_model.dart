import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  BannerModel({
    required this.bannerId,
    required this.bannerTitle,
    required this.bannerContent,
    required this.fotoPath,
    required this.fotoName,
    required this.createAt,
  });

  @JsonKey(name: 'banner_id')
  final String bannerId;
  @JsonKey(name: 'banner_judul')
  final String bannerTitle;
  @JsonKey(name: 'banner_ket')
  final String bannerContent;
  @JsonKey(name: 'foto_path')
  final String fotoPath;
  @JsonKey(name: 'foto_name')
  final String fotoName;
  @JsonKey(name: 'create_at')
  final DateTime createAt;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
