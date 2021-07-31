import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/api_client.dart';
import 'package:sijantan/core/api/response/road_bridge/road_data_response.dart';

abstract class RoadBridgeRemoteDataSrc {
  Future<RoadDataResponse> getRoadData();
// Future<RoadDataResponse> getRoadData();
}

@LazySingleton(as: RoadBridgeRemoteDataSrc)
class RoadBridgeDataSrcImpl implements RoadBridgeRemoteDataSrc {
  final ApiClient _apiClient;

  RoadBridgeDataSrcImpl(this._apiClient);

  @override
  Future<RoadDataResponse> getRoadData() async {
    return await _apiClient.get(
        endpoint: 'database/jalan',
        serializer: RoadDataResponse.serializer,
        extra: {"requiresToken": true}) as RoadDataResponse;
  }
}
