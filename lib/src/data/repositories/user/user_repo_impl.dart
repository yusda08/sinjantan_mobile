import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/api/response/auth/login_response.dart';
import 'package:sijantan/core/api/response/auth/register_response.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/src/data/data_sources/user/user_local_data_src.dart';
import 'package:sijantan/src/data/data_sources/user/user_remote_data_src.dart';
import 'package:sijantan/src/domain/repositories/user/user_repo.dart';

@LazySingleton(as: UserRepo)
class UserRepoImpl implements UserRepo {
  final UserRemoteDataSrc userRemoteDataSrc;
  final UserLocalDataSrc userLocalDataSrc;

  UserRepoImpl(this.userRemoteDataSrc, this.userLocalDataSrc);

  @override
  Future<Either<Exception, RegisterResponse>> register(
      RegisterRequestObject formData) {
    return generalMethod(() => userRemoteDataSrc.register(formData));
  }

  @override
  Future<Either<Exception, LoginResponse>> login(
      LoginRequestObject formData) async {
    return generalMethod(() async {
      final loginResp = await userRemoteDataSrc.login(formData);
      userLocalDataSrc.cacheUserData(loginResp.userData);
      return loginResp;
    });
  }

  @override
  logout() {
    userLocalDataSrc.deleteCache();
  }

  Future<Either<Exception, T>> generalMethod<T>(Function execute) async {
    try {
      T data = await execute();
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    } catch (ex) {
      return Left(CustomException(ApiRespConst.defaultError, innerException:ex));
    }
  }
}
