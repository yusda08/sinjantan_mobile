import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/home/running_text_resp.dart';
import 'package:sijantan/src/domain/repositories/home_repo/home_repo.dart';

@lazySingleton
class GetRunningText {
  HomeRepo repository;

  GetRunningText(this.repository);

  Future<Either<Exception, RunningTextResp>> call() async {
    return await repository.getRunningText();
  }
}
