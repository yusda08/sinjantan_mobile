import 'package:json_annotation/json_annotation.dart';

part 'road_model.g.dart';

@JsonSerializable()
class RoadModel {
  RoadModel({
    required this.roadId,
    required this.roadNo,
    required this.roadName,
    required this.lat,
    required this.long,
  });

  @JsonKey(name: 'jalan_id')
  final String roadId;
  @JsonKey(name: 'ruas_no')
  final String roadNo;
  @JsonKey(name: 'ruas_nama')
  final String roadName;
  @JsonKey(fromJson: _latLngFromJson)
  final double lat;
  @JsonKey(fromJson: _latLngFromJson)
  final double long;

  factory RoadModel.fromJson(Map<String, dynamic> json) =>
      _$RoadModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoadModelToJson(this);

  static double _latLngFromJson(String latLng) {
    return latLng.isNotEmpty ? double.parse(latLng) : 0.0;
  }
}
