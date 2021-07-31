import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/usecases/usecase.dart';
import 'package:sijantan/src/data/models/base_response_model.dart';
import 'package:sijantan/src/domain/repositories/pengaduan/report_repo.dart';

@lazySingleton
class SendRoadReport extends UseCase<BaseRespModel, ReportReqObj> {
  ReportRepo repository;

  SendRoadReport(this.repository);

  @override
  Future<Either<Exception, BaseRespModel>> call(
      ReportReqObj formData) async {
    return await repository.sendRoadReport(formData);
  }
}
