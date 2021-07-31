import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/presentation/report/manager/report_cubit.dart';
import 'package:sijantan/src/presentation/report/widgets/bridge_report_tab.dart';
import 'package:sijantan/src/presentation/report/widgets/report_item_widget.dart';
import 'package:sijantan/src/presentation/report/widgets/road_report_tab.dart';

class MyPengaduanPage extends StatelessWidget {

  // implements AutoRouteWrapper {
  //  @override
  //  Widget wrappedRoute(BuildContext context) => BlocProvider(
  //      create: (_) => sl<ReportCubit>()..getRoadReportData(), child: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PENGADUAN SAYA',
              style: AppTextStyle.poppinsBold(fontSize: 14.sp, color: white)),
          bottom: TabBar(tabs: [
            Tab(
                child: Text('JALAN',
                    style: AppTextStyle.poppinsBold(
                        fontSize: 10.sp, color: white))),
            Tab(
                child: Text('JEMBATAN',
                    style: AppTextStyle.poppinsBold(
                        fontSize: 10.sp, color: white))),
          ]),
        ),
        body: TabBarView(children: [
          BlocProvider(
              create: (_) => sl<ReportCubit>()..getRoadReportData(),
              child: RoadReportTab()),
          BlocProvider(
              create: (_) => sl<ReportCubit>()..getBridgeReportData(),
              child: BridgeReportTab()),
          // BridgeReportTab(),
        ]),
      ),
    );
  }
}
