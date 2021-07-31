import 'package:dartz/dartz.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/api/response/auth/login_response.dart';
import 'package:sijantan/core/api/response/auth/register_response.dart';

abstract class UserRepo {
  Future<Either<Exception, RegisterResponse>> register(
      RegisterRequestObject formData);

  Future<Either<Exception, LoginResponse>> login(LoginRequestObject formData);

  logout();
}
