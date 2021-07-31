import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/report/report_asset.dart';
import 'package:sijantan/src/data/models/report/report_response.dart';

part 'road_report_model.g.dart';

@JsonSerializable()
class RoadReportDataModel {
  RoadReportDataModel({
    required this.reportTicket,
    required this.roadName,
    required this.userCode,
    required this.userName,
    required this.userPhoneNumber,
    required this.reportText,
    required this.reportDate,
    required this.responseStatus,
    required this.reportAssets,
    required this.reportResponse,
  });

  @JsonKey(name: 'tiket_kode')
  final String reportTicket;
  @JsonKey(name: 'jalan_nama')
  final String roadName;
  @JsonKey(name: 'kd_user')
  final String userCode;
  @JsonKey(name: 'pengadu_nama')
  final String userName;
  @JsonKey(name: 'pengadu_no_hp')
  final String userPhoneNumber;
  @JsonKey(name: 'pengadu_ket')
  final String reportText;
  @JsonKey(name: 'pengadu_tgl')
  final DateTime reportDate;
  @JsonKey(name: 'status_respon')
  final String responseStatus;
  @JsonKey(name: 'asset')
  final List<ReportAsset> reportAssets;
  @JsonKey(name: 'respon')
  final List<ReportResponse> reportResponse;

  factory RoadReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$RoadReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoadReportDataModelToJson(this);
}
