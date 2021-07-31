import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/home/banner_resp.dart';
import 'package:sijantan/core/api/response/home/news_resp.dart';
import 'package:sijantan/core/api/response/home/running_text_resp.dart';
import 'package:sijantan/src/data/data_sources/home/home_data_src.dart';
import 'package:sijantan/src/data/repositories/core/general_method.dart';
import 'package:sijantan/src/domain/repositories/home_repo/home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSrc _remoteDataSrc;

  HomeRepoImpl(this._remoteDataSrc);

  @override
  Future<Either<Exception, BannerResp>> getBanner() =>
      generalMethod<BannerResp>(() => _remoteDataSrc.getBanner());

  @override
  Future<Either<Exception, NewsResp>> getNews() =>
      generalMethod<NewsResp>(() => _remoteDataSrc.getNews());

  @override
  Future<Either<Exception, RunningTextResp>> getRunningText() =>
      generalMethod<RunningTextResp>(() => _remoteDataSrc.getRunningText());
}
