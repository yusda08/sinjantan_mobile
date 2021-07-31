import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/api/response/report/bridge_report_data_resp.dart';
import 'package:sijantan/core/api/response/report/road_report_data_resp.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/src/data/data_sources/report/report_data_src.dart';
import 'package:sijantan/src/data/models/base_response_model.dart';
import 'package:sijantan/src/data/repositories/core/general_method.dart';
import 'package:sijantan/src/domain/repositories/pengaduan/report_repo.dart';

@LazySingleton(as: ReportRepo)
class ReportRepoImpl implements ReportRepo {
  final ReportRemoteDataSrc _remoteDataSrc;

  ReportRepoImpl(this._remoteDataSrc);

  @override
  Future<Either<Exception, BaseRespModel>> sendRoadReport(ReportReqObj reqObj) {
    return generalMethod<BaseRespModel>(
        () => _remoteDataSrc.sendRoadReport(reqObj));
  }

  @override
  Future<Either<Exception, BaseRespModel>> sendBridgeReport(
      ReportReqObj reqObj) {
    return generalMethod<BaseRespModel>(
        () => _remoteDataSrc.sendBridgeReport(reqObj));
  }

  @override
  Future<Either<Exception, RoadReportDataResp>> getRoadReportData() {
    return generalMethod<RoadReportDataResp>(
        () => _remoteDataSrc.getRoadReportData());
  }

  @override
  Future<Either<Exception, BridgeReportDataResp>> getBridgeReportData() {
    return generalMethod<BridgeReportDataResp>(
        () => _remoteDataSrc.getBridgeReportData());
  }

  @override
  Future<Either<Exception, BaseRespModel>> deleteRoadReport(
      String reportTicket) {
    return generalMethod<BaseRespModel>(
        () => _remoteDataSrc.deleteRoadReport(reportTicket));
  }

  @override
  Future<Either<Exception, BaseRespModel>> deleteBridgeReport(
      String reportTicket) {
    return generalMethod<BaseRespModel>(
        () => _remoteDataSrc.deleteBridgeReport(reportTicket));
  }
}
