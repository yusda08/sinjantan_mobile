import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/api/response/auth/register_response.dart';
import 'package:sijantan/core/usecases/usecase.dart';
import 'package:sijantan/src/data/repositories/user/user_repo_impl.dart';
import 'package:sijantan/src/domain/repositories/user/user_repo.dart';

@lazySingleton
class Logout {
  UserRepo repository;

  Logout(this.repository);

  call() {
    return repository.logout();
  }
}
