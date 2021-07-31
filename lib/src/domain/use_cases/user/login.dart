import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/response/auth/login_response.dart';
import 'package:sijantan/core/usecases/usecase.dart';
import 'package:sijantan/src/domain/repositories/user/user_repo.dart';

@lazySingleton
class UserLogin extends UseCase<LoginResponse, LoginRequestObject> {
  UserRepo repository;

  UserLogin(this.repository);

  @override
  Future<Either<Exception, LoginResponse>> call(
      LoginRequestObject formData) async {
    return await repository.login(formData);
  }
}
