import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/road_bridge/road_data_response.dart';
import 'package:sijantan/src/domain/repositories/road_bridge/road_bridge_repo.dart';

@lazySingleton
class GetRoadData {
  RoadBridgeRepo repository;

  GetRoadData(this.repository);

  Future<Either<Exception, RoadDataResponse>> call() async {
    return await repository.getRoadData();
  }
}
