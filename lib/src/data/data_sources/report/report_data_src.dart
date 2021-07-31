import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/api_client.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/api/response/report/bridge_report_data_resp.dart';
import 'package:sijantan/core/api/response/report/road_report_data_resp.dart';
import 'package:sijantan/src/data/models/base_response_model.dart';
import 'package:http_parser/http_parser.dart';

abstract class ReportRemoteDataSrc {
  Future<RoadReportDataResp> getRoadReportData();

  Future<BridgeReportDataResp> getBridgeReportData();

  Future<BaseRespModel> sendRoadReport(ReportReqObj reqObj);

  Future<BaseRespModel> sendBridgeReport(ReportReqObj reqObj);

  Future<BaseRespModel> deleteRoadReport(String reportTicket);

  Future<BaseRespModel> deleteBridgeReport(String reportTicket);
}

@LazySingleton(as: ReportRemoteDataSrc)
class ReportDataSrcImpl implements ReportRemoteDataSrc {
  final ApiClient _apiClient;

  ReportDataSrcImpl(this._apiClient);

  @override
  Future<BaseRespModel> sendRoadReport(ReportReqObj reqObj) async {
    final formData = FormData.fromMap({
      'jalan_nama': reqObj.roadOrBridgeName,
      'keterangan': reqObj.keterangan,
      'file_images[]': reqObj.listFile
          .map((e) => MultipartFile.fromFileSync(e!.image.path,
              filename: e.image.path.split(Platform.pathSeparator).last,
              contentType: MediaType.parse('image/jpeg')))
          .toList(),
      'lat[]': reqObj.listFile.map((e) => e?.imageLatLong.latitude).toList(),
      'long[]': reqObj.listFile.map((e) => e?.imageLatLong.longitude).toList(),
    });

    return await _apiClient.post(
        endpoint: 'pengaduan/jalan',
        serializer: BaseRespModel.serializer,
        body: formData,
        extra: {"requiresToken": true}) as BaseRespModel;
  }

  @override
  Future<BaseRespModel> sendBridgeReport(ReportReqObj reqObj) async {
    final formData = FormData.fromMap({
      'jembatan_nama': reqObj.roadOrBridgeName,
      'keterangan': reqObj.keterangan,
      'file_images[]': reqObj.listFile
          .map((e) => MultipartFile.fromFileSync(e!.image.path,
              filename: e.image.path.split(Platform.pathSeparator).last,
              contentType: MediaType.parse('image/jpeg')))
          .toList(),
      'lat[]': reqObj.listFile.map((e) => e?.imageLatLong.latitude).toList(),
      'long[]': reqObj.listFile.map((e) => e?.imageLatLong.longitude).toList(),
    });

    return await _apiClient.post(
        endpoint: 'pengaduan/jembatan',
        serializer: BaseRespModel.serializer,
        body: formData,
        extra: {"requiresToken": true}) as BaseRespModel;
  }

  @override
  Future<RoadReportDataResp> getRoadReportData() async {
    return await _apiClient.get(
        endpoint: 'pengaduan/jalan',
        serializer: RoadReportDataResp.serializer,
        extra: {"requiresToken": true}) as RoadReportDataResp;
  }

  @override
  Future<BridgeReportDataResp> getBridgeReportData() async {
    return await _apiClient.get(
        endpoint: 'pengaduan/jembatan',
        serializer: BridgeReportDataResp.serializer,
        extra: {"requiresToken": true}) as BridgeReportDataResp;
  }

  @override
  Future<BaseRespModel> deleteBridgeReport(String reportTicket) async {
    return await _apiClient.request(
        endpoint: 'pengaduan/jembatan/$reportTicket',
        method: 'DELETE',
        serializer: BaseRespModel.serializer,
        extra: {"requiresToken": true}) as BaseRespModel;
  }

  @override
  Future<BaseRespModel> deleteRoadReport(String reportTicket) async {
    return await _apiClient.request(
        endpoint: 'pengaduan/jalan/$reportTicket',
        method: 'DELETE',
        serializer: BaseRespModel.serializer,
        extra: {"requiresToken": true}) as BaseRespModel;
  }
}
