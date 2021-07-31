import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/src/data/data_sources/user/user_local_data_src.dart';
import 'package:sijantan/src/data/models/user/user_model.dart';

import 'injection.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  HiveInterface get hiveInterface => Hive;

  @lazySingleton
  Location get location => Location();

  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  Dio get dio {
    final Dio dio = Dio(BaseOptions(baseUrl: kBaseUrl));
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }
}

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('onRequest');
    if (options.extra.containsKey("requiresToken")) {
      options.extra.remove("requiresToken");
      UserModel? userData = sl<UserLocalDataSrc>().getData();
      if (userData != null)
        options.headers.addAll({"Authorization": "Bearer ${userData.token}"});
    }
    debugPrint(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path)}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    if (options.queryParameters != null) {
      debugPrint("queryParameters:");
      options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    }
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return handler.next(options);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    debugPrint('onError');
    debugPrint(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
    debugPrint(
        "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    debugPrint("<-- End error");
    return handler.next(dioError);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('onResponse');
    debugPrint(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.baseUrl) : 'URL')}");
    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("Response: ${response.data}");
    debugPrint("<-- END HTTP");
    return handler.next(response);
  }
}
