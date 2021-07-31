import 'package:sijantan/core/error/exception/api_exception.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/error/exception/server_exception.dart';

class ExceptionMapper {
  const ExceptionMapper._();

  static String call(Exception error) {
    switch (error.runtimeType) {
      case ApiException:
        return (error as ApiException).error.detail;
      case ServerException:
        return (error as ServerException).message;
      case CustomException:
        return (error as CustomException).getMessage;
      default:
        return "Terjadi Exception $error";
    }
  }
}
