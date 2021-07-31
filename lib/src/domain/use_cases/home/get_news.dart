import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/home/news_resp.dart';
import 'package:sijantan/src/domain/repositories/home_repo/home_repo.dart';

@lazySingleton
class GetNews {
  HomeRepo repository;

  GetNews(this.repository);

  Future<Either<Exception, NewsResp>> call() async {
    return await repository.getNews();
  }
}
