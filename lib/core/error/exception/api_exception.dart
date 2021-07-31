import 'package:sijantan/core/api/api_error.dart';

class ApiException implements Exception {
  ApiError error;
  int statusCode;

  ApiException(this.error, this.statusCode);

  String getMessage() {
    return error.detail;
  }

  int getCode() {
    return statusCode;
  }
}
