import 'package:dartz/dartz.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/api/response/report/bridge_report_data_resp.dart';
import 'package:sijantan/core/api/response/report/road_report_data_resp.dart';
import 'package:sijantan/src/data/models/base_response_model.dart';

abstract class ReportRepo {
  Future<Either<Exception, BaseRespModel>> sendRoadReport(ReportReqObj reqObj);

  Future<Either<Exception, BaseRespModel>> sendBridgeReport(
      ReportReqObj reqObj);

  Future<Either<Exception, RoadReportDataResp>> getRoadReportData();

  Future<Either<Exception, BridgeReportDataResp>> getBridgeReportData();

  Future<Either<Exception, BaseRespModel>> deleteRoadReport(
      String reportTicket);

  Future<Either<Exception, BaseRespModel>> deleteBridgeReport(
      String reportTicket);
}
