class CustomException implements Exception {
  String message;
  int? statusCode;

  dynamic innerException;

  CustomException(this.message, {this.statusCode, this.innerException});

  String get getMessage =>
      message + innerException != null ? innerException.toString() : '';

  int? getCode() {
    return statusCode;
  }
}
