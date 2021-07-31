import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sijantan/src/presentation/report/manager/report_cubit.dart';
import 'package:sijantan/src/presentation/report/widgets/report_item_widget.dart';

class BridgeReportTab extends StatefulWidget {
  @override
  _BridgeReportTabState createState() => _BridgeReportTabState();
}

class _BridgeReportTabState extends State<BridgeReportTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {
        state.maybeWhen(
            deleteReportSuccess: (msg) {
              Fluttertoast.showToast(msg: msg);
              context.read<ReportCubit>().getBridgeReportData();
            },
            bridgeReportLoaded: (msg) {},
            loading: () {},
            orElse: () => Fluttertoast.showToast(msg: 'Terjadi Kesalahan'));
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(child: CircularProgressIndicator()),
          bridgeReportLoaded: (data) => data.length == 0
              ? Center(child: Text('Belum ada pengaduan'))
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<ReportCubit>().getBridgeReportData();
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(8),
                    itemCount: data.length,
                    itemBuilder: (ctx, index) {
                      return ReportItemWidget(reportItem: data[index]);
                    },
                  ),
                ),
          orElse: () => Center(child: Text('Terjadi Kesalahan')),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
