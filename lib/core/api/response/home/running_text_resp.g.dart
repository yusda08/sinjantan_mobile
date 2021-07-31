// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_text_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunningTextResp _$RunningTextRespFromJson(Map<String, dynamic> json) {
  return RunningTextResp(
    message: json['msg'] as String,
    status: json['status'] as int,
    result: RunningText.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RunningTextRespToJson(RunningTextResp instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'status': instance.status,
      'result': instance.result,
    };

RunningText _$RunningTextFromJson(Map<String, dynamic> json) {
  return RunningText(
    text: json['run_ket'] as String,
  );
}

Map<String, dynamic> _$RunningTextToJson(RunningText instance) =>
    <String, dynamic>{
      'run_ket': instance.text,
    };
