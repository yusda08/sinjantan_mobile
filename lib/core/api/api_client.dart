import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sijantan/core/api/response/response_object.dart';
import 'package:sijantan/core/error/exception/api_exception.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/error/exception/server_exception.dart';

import 'api_error.dart';
import 'api_response.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;
  final Logger _logger;

  ApiClient(this._dio, this._logger);

  Future<ResponseObject> get(
      {required String endpoint,
      required ResponseObject Function(Map<String, dynamic>) serializer,
      Map<String, String>? queryParams,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra,
      String? token}) async {
    try {
      final response = await _dio.get(endpoint,
          options: Options(headers: headers, extra: extra),
          queryParameters: queryParams);
      ApiResponse apiResponse = handleResponse(response);
      return serializer(apiResponse.body);
    } on DioError catch (ex) {
      _logger.v('DioError Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      handleError(ex.response);
      throw ServerException.withError(error: ex);
    } catch (ex) {
      _logger.v('Catching Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException("Something is wrong with your request!",
          innerException: ex);
    }
  }

  Future<ResponseObject> post({
    required String endpoint,
    required ResponseObject Function(Map<String, dynamic>) serializer,
    body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    String? token,
    String? preferredUrl,
  }) async {
    try {
      final Response response = await _dio.post(endpoint,
          options: Options(
              headers: headers,
              extra: extra,
              contentType: 'application/x-www-form-urlencoded'),
          data: body);
      print(response.data.toString());
      ApiResponse apiResponse = handleResponse(response);
      return serializer(apiResponse.body);
    } on DioError catch (ex) {
      _logger.w('DioError Unexepected exception obtained with request POST ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      handleError(ex.response);
      throw ServerException.withError(error: ex);
    } catch (ex) {
      _logger.w('Catching Unexepected exception obtained with request POST ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException("Something is wrong with your request",
          innerException: ex);
    }
  }

  Future<ResponseObject> request(
      {required String endpoint,
      required ResponseObject Function(Map<String, dynamic>) serializer,
      required String method,
      Map<String, String>? queryParams,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra,
      String? token}) async {
    try {
      final response = await _dio.request(endpoint,
          options: Options(
            method: method,
            headers: headers,
            extra: extra,
          ),
          queryParameters: queryParams);
      ApiResponse apiResponse = handleResponse(response);
      return serializer(apiResponse.body);
    } on DioError catch (ex) {
      _logger.v('DioError Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      handleError(ex.response);
      throw ServerException.withError(error: ex);
    } catch (ex) {
      _logger.v('Catching Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException("Something is wrong with your request!",
          innerException: ex);
    }
  }

  ApiResponse handleResponse(Response response) {
    _logger.i('Response for ' +
        response.requestOptions.path +
        '\nStatus code: ' +
        response.statusCode.toString() +
        '\nBody:\n' +
        response.data.toString());

    Map<String, dynamic> body = Map<String, dynamic>();
    if (response.data.isNotEmpty) {
      body = response.data;
    }

    final apiResponse = ApiResponse(response.statusCode!, body);

    if (apiResponse.wasSuccessful()) {
      return apiResponse;
    } else {
      ApiError error = ApiError.fromJson(apiResponse.body);
      throw ApiException(error, apiResponse.statusCode);
    }
  }

  void handleError(Response? response) {
    if (response == null) return;
    Map<String, dynamic> body = Map<String, dynamic>();
    if (response.data.isNotEmpty) {
      body = response.data;
    }
    final apiResponse = ApiResponse(response.statusCode!, body);

    if (apiResponse.wasBadRequest()) {
      ApiError error = ApiError.fromJson(apiResponse.body);
      throw ApiException(error, apiResponse.statusCode);
    }
  }

// String buildUrl(
//     {required String endpoint,
//     Map<String, String>? queryParams,
//     String? preferredUrl}) {
//   var apiUri =
//       preferredUrl != null ? Uri.parse(preferredUrl) : Uri.parse(_baseUrl);
//   final apiPath = apiUri.path + "/" + endpoint;
//   final uri = Uri(
//           scheme: apiUri.scheme,
//           host: apiUri.host,
//           path: apiPath,
//           queryParameters: queryParams)
//       .toString();
//   return uri;
// }
}
