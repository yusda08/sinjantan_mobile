import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/usecases/usecase.dart';
import 'package:sijantan/src/data/models/base_response_model.dart';
import 'package:sijantan/src/domain/repositories/pengaduan/report_repo.dart';

@lazySingleton
class DeleteRoadReport extends UseCase<BaseRespModel, String> {
  ReportRepo repository;

  DeleteRoadReport(this.repository);

  @override
  Future<Either<Exception, BaseRespModel>> call(String reportTicker) async {
    return await repository.deleteRoadReport(reportTicker);
  }
}
