import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/report/bridge_report_model.dart';
import 'package:sijantan/src/data/models/report/road_report_model.dart';
import '../response_object.dart';

part 'bridge_report_data_resp.g.dart';

@JsonSerializable()
class BridgeReportDataResp extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final List<BridgeReportDataModel> result;

  BridgeReportDataResp({
    required this.message,
    required this.status,
    required this.result,
  }) : super(message: message, status: status);

  factory BridgeReportDataResp.fromJson(Map<String, dynamic> json) =>
      _$BridgeReportDataRespFromJson(json);

  Map<String, dynamic> toJson() => _$BridgeReportDataRespToJson(this);

  static get serializer => _$BridgeReportDataRespFromJson;
}
