import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/report/road_report_model.dart';
import '../response_object.dart';

part 'road_report_data_resp.g.dart';

@JsonSerializable()
class RoadReportDataResp extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final List<RoadReportDataModel> result;

  RoadReportDataResp({
    required this.message,
    required this.status,
    required this.result,
  }) : super(message: message, status: status);

  factory RoadReportDataResp.fromJson(Map<String, dynamic> json) =>
      _$RoadReportDataRespFromJson(json);

  Map<String, dynamic> toJson() => _$RoadReportDataRespToJson(this);

  static get serializer => _$RoadReportDataRespFromJson;
}
