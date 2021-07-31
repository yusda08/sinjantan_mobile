import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/report/road_report_model.dart';
import 'package:sijantan/src/data/models/road_bridge/road_model.dart';
import '../response_object.dart';

part 'road_data_response.g.dart';

@JsonSerializable(createToJson: true)
class RoadDataResponse extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final List<RoadModel> result;

  RoadDataResponse({
    required this.message,
    required this.status,
    required this.result,
  }) : super(message: message, status: status);

  factory RoadDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RoadDataResponseFromJson(json);

  static get serializer => _$RoadDataResponseFromJson;

  Map toJson() {
    return _$RoadDataResponseToJson(this);
  }
}
