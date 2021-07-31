// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadModel _$RoadModelFromJson(Map<String, dynamic> json) {
  return RoadModel(
    roadId: json['jalan_id'] as String,
    roadNo: json['ruas_no'] as String,
    roadName: json['ruas_nama'] as String,
    lat: RoadModel._latLngFromJson(json['lat'] as String),
    long: RoadModel._latLngFromJson(json['long'] as String),
  );
}

Map<String, dynamic> _$RoadModelToJson(RoadModel instance) => <String, dynamic>{
      'jalan_id': instance.roadId,
      'ruas_no': instance.roadNo,
      'ruas_nama': instance.roadName,
      'lat': instance.lat,
      'long': instance.long,
    };
