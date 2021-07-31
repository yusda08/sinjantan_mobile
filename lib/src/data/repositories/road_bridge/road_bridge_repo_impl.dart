import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/road_bridge/road_data_response.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/src/data/data_sources/road_bridge/road_bridge_remote_data_src.dart';
import 'package:sijantan/src/domain/repositories/road_bridge/road_bridge_repo.dart';

@LazySingleton(as: RoadBridgeRepo)
class RoadBridgeRepoImpl implements RoadBridgeRepo {
  final RoadBridgeRemoteDataSrc _remoteDataSrc;

  RoadBridgeRepoImpl(this._remoteDataSrc);

  @override
  Future<Either<Exception, RoadDataResponse>> getRoadData() async {
    try {
      final roadResp = await _remoteDataSrc.getRoadData();
      return Right(roadResp);
    } on Exception catch (e) {
      return Left(e);
    } catch (ex) {
      return Left(CustomException(ApiRespConst.defaultError, innerException:ex));
    }
  }
}
