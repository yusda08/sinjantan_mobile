import 'package:json_annotation/json_annotation.dart';

part 'report_asset.g.dart';


@JsonSerializable()
class ReportAsset {
  ReportAsset({
    required this.reportAssetId,
    required this.lat,
    required this.long,
    required this.photoPath,
    required this.photoName,
    required this.photoNameThumb,
  });

  @JsonKey(name: 'id_asset')
  final String reportAssetId;
  final String lat;
  final String long;
  @JsonKey(name: 'foto_path')
  final String photoPath;
  @JsonKey(name: 'foto_name')
  final String photoName;
  @JsonKey(name: 'foto_name_thumb')
  final String photoNameThumb;

  factory ReportAsset.fromJson(Map<String, dynamic> json) =>
      _$ReportAssetFromJson(json);

  Map<String, dynamic> toJson() => _$ReportAssetToJson(this);
}