part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = Initial;

  const factory ReportState.loading() = Loading;

  const factory ReportState.sendReportSuccess({required String msg}) =
      SendReportSuccess;

  const factory ReportState.deleteReportSuccess({required String msg}) =
      DeleteReportSuccess;

  const factory ReportState.roadReportLoaded(
      {required List<RoadReportDataModel> data}) = RoadReportLoaded;

  const factory ReportState.bridgeReportLoaded(
      {required List<BridgeReportDataModel> data}) = BridgeReportLoaded;

  const factory ReportState.failure({required String msg}) = Failure;
}
