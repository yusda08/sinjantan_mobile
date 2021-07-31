import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/api/response/report/road_report_data_resp.dart';
import 'package:sijantan/core/usecases/usecase.dart';
import 'package:sijantan/src/data/models/base_response_model.dart';
import 'package:sijantan/src/domain/repositories/pengaduan/report_repo.dart';

@lazySingleton
class GetRoadReportData {
  ReportRepo repository;

  GetRoadReportData(this.repository);

  Future<Either<Exception, RoadReportDataResp>> call() async {
    return await repository.getRoadReportData();
  }
}
