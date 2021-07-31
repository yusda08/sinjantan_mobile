import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/api_client.dart';
import 'package:sijantan/core/api/response/home/banner_resp.dart';
import 'package:sijantan/core/api/response/home/news_resp.dart';
import 'package:sijantan/core/api/response/home/running_text_resp.dart';

abstract class HomeRemoteDataSrc {
  Future<NewsResp> getNews();

  Future<BannerResp> getBanner();

  Future<RunningTextResp> getRunningText();
}

@LazySingleton(as: HomeRemoteDataSrc)
class HomeRemoteDataSrcImpl implements HomeRemoteDataSrc {
  final ApiClient _apiClient;

  HomeRemoteDataSrcImpl(this._apiClient);

  @override
  Future<NewsResp> getNews() async {
    return await _apiClient.get(
        endpoint: 'aplikasi/news',
        serializer: NewsResp.serializer,
        extra: {"requiresToken": true}) as NewsResp;
  }

  @override
  Future<BannerResp> getBanner() async {
    return await _apiClient.get(
        endpoint: 'aplikasi/banner',
        serializer: BannerResp.serializer,
        extra: {"requiresToken": true}) as BannerResp;
  }

  @override
  Future<RunningTextResp> getRunningText() async {
    return await _apiClient.get(
        endpoint: 'aplikasi/running_text',
        serializer: RunningTextResp.serializer,
        extra: {"requiresToken": true}) as RunningTextResp;
  }
}
