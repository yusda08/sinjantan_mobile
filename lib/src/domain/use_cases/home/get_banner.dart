import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/home/banner_resp.dart';
import 'package:sijantan/src/domain/repositories/home_repo/home_repo.dart';

@lazySingleton
class GetBanner {
  HomeRepo repository;

  GetBanner(this.repository);

  Future<Either<Exception, BannerResp>> call() async {
    return await repository.getBanner();
  }
}
