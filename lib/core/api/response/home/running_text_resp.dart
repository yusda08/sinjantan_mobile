import 'package:json_annotation/json_annotation.dart';
import 'package:sijantan/src/data/models/home/banner_model.dart';

import '../response_object.dart';

part 'running_text_resp.g.dart';

@JsonSerializable()
class RunningTextResp extends ResponseObject {
  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'result')
  final RunningText result;

  RunningTextResp({
    required this.message,
    required this.status,
    required this.result,
  }) : super(message: message, status: status);

  factory RunningTextResp.fromJson(Map<String, dynamic> json) =>
      _$RunningTextRespFromJson(json);

  Map<String, dynamic> toJson() => _$RunningTextRespToJson(this);

  static get serializer => _$RunningTextRespFromJson;
}

@JsonSerializable()
class RunningText {
  RunningText({
    required this.text,
  });

  @JsonKey(name: 'run_ket')
  final String text;

  factory RunningText.fromJson(Map<String, dynamic> json) =>
      _$RunningTextFromJson(json);

  Map<String, dynamic> toJson() => _$RunningTextToJson(this);
}
