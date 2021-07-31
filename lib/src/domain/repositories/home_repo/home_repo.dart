import 'package:dartz/dartz.dart';
import 'package:sijantan/core/api/response/home/banner_resp.dart';
import 'package:sijantan/core/api/response/home/news_resp.dart';
import 'package:sijantan/core/api/response/home/running_text_resp.dart';

abstract class HomeRepo {
  Future<Either<Exception, NewsResp>> getNews();

  Future<Either<Exception, BannerResp>> getBanner();

  Future<Either<Exception, RunningTextResp>> getRunningText();
}
