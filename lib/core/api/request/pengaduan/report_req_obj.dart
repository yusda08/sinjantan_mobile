
import 'package:sijantan/src/data/models/road_bridge/road_bridge_file.dart';

import '../request_object.dart';

class ReportReqObj implements RequestObject {
  final String roadOrBridgeName;
  final String keterangan;
  final List<RoadBridgeFile?> listFile;
  // final List<File?> listFile;

  const ReportReqObj({
    required this.roadOrBridgeName,
    required this.keterangan,
    required this.listFile,
  });

  @override
  Map getJsonBody() {
    throw UnimplementedError();
  }
}
