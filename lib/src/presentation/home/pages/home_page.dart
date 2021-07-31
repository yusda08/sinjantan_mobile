import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/route/route.gr.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/presentation/home/manager/banner/banner_cubit.dart';
import 'package:sijantan/src/presentation/home/manager/news/news_cubit.dart';
import 'package:sijantan/src/presentation/home/manager/running_text/running_text_cubit.dart';
import 'package:sijantan/src/presentation/home/widgets/banner_section.dart';
import 'package:sijantan/src/presentation/home/widgets/marque_widget.dart';
import 'package:sijantan/src/presentation/home/widgets/news_section.dart';
import 'package:sijantan/src/presentation/widgets/banner_shimmer.dart';

import '../widgets/drawer_widget.dart';

class HomePage extends StatefulWidget implements AutoRouteWrapper {
  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => sl<BannerCubit>()..getBanner()),
      BlocProvider(create: (_) => sl<NewsCubit>()..getNews()),
      BlocProvider(create: (_) => sl<RunningTextCubit>()..getRunningText()),
    ], child: this);
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: MarqueWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                })),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.solidBell, color: black),
            onPressed: () {},
          )
        ],
      ),
      drawer: DrawerWidget(context),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            _buildBg(),
            RefreshIndicator(
              onRefresh: () async {
                context.read<NewsCubit>().getNews();
                context.read<BannerCubit>().getBanner();
                context.read<RunningTextCubit>().getRunningText();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHead(),
                    _buildButtonPengaduan(context),
                    Column(
                      children: [
                        SizedBox(height: 20.h),
                        NewsSection(),
                        _buildLastPengaduan(),
                        SizedBox(height: 50.h)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBg() => Container(
        height: 200.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlue, Colors.white])),
      );

  _buildHead() {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().statusBarHeight + 16.h,
          bottom: 16,
          right: 16,
          left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 65.r,
            height: 65.r,
          ),
          const SizedBox(height: 10),
          Text('Dinas Pekerjaan Umum\ndan Penataan Ruang',
              textAlign: TextAlign.center,
              style: AppTextStyle.poppinsBold(fontSize: 18.sp)
                  .copyWith(height: 1.2)),
          Text('Pemerintah Kab. Tapin',
              style: AppTextStyle.poppinsReg(fontSize: 14.sp)),
          const SizedBox(height: 10),
          BannerSection(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _buildButtonPengaduan(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.zero,
                elevation: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    context.router.push(RoadReportFormPageRoute());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(FontAwesomeIcons.road,
                                color: Colors.lightBlue, size: 35.w),
                            Positioned(
                                right: -5,
                                child: Icon(FontAwesomeIcons.exclamation,
                                    color: Colors.red, size: 15)),
                          ],
                        ),
                        SizedBox(height: 10.w),
                        Text('Pengaduan\nJalan',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.poppinsBold(fontSize: 14.sp))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.zero,
                elevation: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    context.router.push(BridgeReportFormPageRoute());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(FontAwesomeIcons.archway,
                                color: Colors.lightBlue, size: 35.w),
                            Positioned(
                                right: -5,
                                child: Icon(FontAwesomeIcons.exclamation,
                                    color: Colors.red, size: 15)),
                          ],
                        ),
                        SizedBox(height: 10.w),
                        Text('Pengaduan\nJembatan',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.poppinsBold(fontSize: 14.sp))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  _buildLastPengaduan() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pengaduan Terakhir',
                    style: AppTextStyle.poppinsMed(fontSize: 12.sp)),
                Text('Lihat Semua',
                    style: AppTextStyle.poppinsReg(
                        fontSize: 10.sp, color: Colors.blue)),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 16),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // PengaduanWidget(),
                // PengaduanWidget(),
              ],
            ),
          ),
        ],
      );
}
