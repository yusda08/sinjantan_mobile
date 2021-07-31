import 'dart:io';

class ApiResponse {
  int statusCode;
  Map<String, dynamic> body;

  ApiResponse(this.statusCode, this.body);

  bool wasSuccessful() {
    return statusCode >= 200 && statusCode < 300;
  }

  bool wasBadRequest() {
    return statusCode == HttpStatus.badRequest;
  }
}
