import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/error/exception_mapper.dart';
import 'package:sijantan/src/data/models/report/bridge_report_model.dart';
import 'package:sijantan/src/data/models/report/road_report_model.dart';
import 'package:sijantan/src/domain/use_cases/report/delete_bridge_report.dart';
import 'package:sijantan/src/domain/use_cases/report/delete_road_report.dart';
import 'package:sijantan/src/domain/use_cases/report/get_bridge_report_data.dart';
import 'package:sijantan/src/domain/use_cases/report/get_road_report_data.dart';
import 'package:sijantan/src/domain/use_cases/report/send_bridge_report.dart';
import 'package:sijantan/src/domain/use_cases/report/send_road_report.dart';

part 'report_cubit.freezed.dart';

part 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState> {
  final SendRoadReport _sendRoadReport;
  final SendBridgeReport _sendBridgeReport;
  final GetRoadReportData _getRoadReportData;
  final GetBridgeReportData _getBridgeReportData;
  final DeleteRoadReport _deleteRoadReport;
  final DeleteBridgeReport _deleteBridgeReport;

  ReportCubit(
    SendRoadReport sendRoadReport,
    SendBridgeReport sendBridgeReport,
    GetRoadReportData getRoadReportData,
    GetBridgeReportData getBridgeReportData,
    DeleteRoadReport deleteRoadReport,
    DeleteBridgeReport deleteBridgeReport,
  )   : _sendRoadReport = sendRoadReport,
        _getRoadReportData = getRoadReportData,
        _getBridgeReportData = getBridgeReportData,
        _sendBridgeReport = sendBridgeReport,
        _deleteRoadReport = deleteRoadReport,
        _deleteBridgeReport = deleteBridgeReport,
        super(const Initial());

  sendRoadReport(ReportReqObj formData) async {
    emit(Loading());
    final sendRoadReportOrFailure = await _sendRoadReport(formData);
    sendRoadReportOrFailure.fold(
        (l) => emit(Failure(msg: ExceptionMapper.call(l))),
        (r) => emit(SendReportSuccess(msg: r.message)));
  }

  sendBridgeReport(ReportReqObj formData) async {
    emit(Loading());
    final sendBridgeReportOrFailure = await _sendBridgeReport(formData);
    sendBridgeReportOrFailure.fold(
        (l) => emit(Failure(msg: ExceptionMapper.call(l))),
        (r) => emit(SendReportSuccess(msg: r.message)));
  }

  getRoadReportData() async {
    emit(Loading());
    final getRoadReportData = await _getRoadReportData();
    getRoadReportData.fold((l) => emit(Failure(msg: ExceptionMapper.call(l))),
        (r) => emit(RoadReportLoaded(data: r.result)));
  }

  getBridgeReportData() async {
    emit(Loading());
    final getBridgeReportData = await _getBridgeReportData();
    getBridgeReportData.fold((l) => emit(Failure(msg: ExceptionMapper.call(l))),
        (r) => emit(BridgeReportLoaded(data: r.result)));
  }

  deleteRoadReport(String reportTicker) async {
    emit(Loading());
    final sendRoadReportOrFailure = await _deleteRoadReport(reportTicker);
    sendRoadReportOrFailure.fold(
        (l) => emit(Failure(msg: ExceptionMapper.call(l))),
        (r) => emit(ReportState.deleteReportSuccess(msg: r.message)));
  }

  deleteBridgeReport(String reportTicker) async {
    emit(Loading());
    final sendBridgeReportOrFailure = await _deleteBridgeReport(reportTicker);
    sendBridgeReportOrFailure.fold(
        (l) => emit(Failure(msg: ExceptionMapper.call(l))),
        (r) => emit(ReportState.deleteReportSuccess(msg: r.message)));
  }
}
