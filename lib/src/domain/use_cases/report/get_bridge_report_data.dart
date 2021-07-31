import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/report/bridge_report_data_resp.dart';
import 'package:sijantan/src/domain/repositories/pengaduan/report_repo.dart';

@lazySingleton
class GetBridgeReportData {
  ReportRepo repository;

  GetBridgeReportData(this.repository);

  Future<Either<Exception, BridgeReportDataResp>> call() async {
    return await repository.getBridgeReportData();
  }
}
