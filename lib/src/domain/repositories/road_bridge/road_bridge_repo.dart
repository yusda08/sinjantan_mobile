import 'package:dartz/dartz.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/api/response/auth/login_response.dart';
import 'package:sijantan/core/api/response/auth/register_response.dart';
import 'package:sijantan/core/api/response/road_bridge/road_data_response.dart';

abstract class RoadBridgeRepo {
  Future<Either<Exception, RoadDataResponse>> getRoadData();
}
