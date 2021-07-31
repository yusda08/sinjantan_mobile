import 'package:dartz/dartz.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/utils/const.dart';

Future<Either<Exception, T>> generalMethod<T>(Function execute) async {
  try {
    T data = await execute();
    return Right(data);
  } on Exception catch (e) {
    return Left(e);
  } catch (ex) {
    return Left(CustomException(ApiRespConst.defaultError, innerException: ex));
  }
}
