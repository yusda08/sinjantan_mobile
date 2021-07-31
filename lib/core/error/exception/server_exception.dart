import 'package:dio/dio.dart';

class ServerException implements Exception {
  String message = "";
  int? statusCode;

  ServerException.withError({required DioError error}) {
    _handleError(error);
  }

  getCode() {
    return statusCode;
  }

  getMessage() {
    return message;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        message = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout";
        break;
      case DioErrorType.other:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        message =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        message = "Receive timeout in send request";
        break;
      default:
        message = "Terjadi Kesalahan Pada Server";
    }
    statusCode = error.response?.statusCode;
    return message;
  }
}
