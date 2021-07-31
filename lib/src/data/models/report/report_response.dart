import 'package:json_annotation/json_annotation.dart';

part 'report_response.g.dart';


@JsonSerializable()
class ReportResponse {
  ReportResponse({
    required this.responseText,
    required this.responseDate,
  });

  @JsonKey(name: 'respon_ket')
  final String responseText;
  @JsonKey(name: 'respon_tgl')
  final DateTime responseDate;

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}
