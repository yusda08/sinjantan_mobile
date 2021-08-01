// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i7;

import '../core/api/api_client.dart' as _i10;
import '../core/utils/fcm_helper.dart' as _i4;
import '../src/data/data_sources/home/home_data_src.dart' as _i11;
import '../src/data/data_sources/report/report_data_src.dart' as _i14;
import '../src/data/data_sources/road_bridge/road_bridge_remote_data_src.dart'
    as _i17;
import '../src/data/data_sources/user/user_local_data_src.dart' as _i8;
import '../src/data/data_sources/user/user_location_data.dart' as _i9;
import '../src/data/data_sources/user/user_remote_data_src.dart' as _i22;
import '../src/data/repositories/home_repo/home_repo_impl.dart' as _i13;
import '../src/data/repositories/pengaduan/road_bridge_repo_impl.dart' as _i16;
import '../src/data/repositories/road_bridge/road_bridge_repo_impl.dart'
    as _i19;
import '../src/data/repositories/user/user_repo_impl.dart' as _i24;
import '../src/domain/repositories/home_repo/home_repo.dart' as _i12;
import '../src/domain/repositories/pengaduan/report_repo.dart' as _i15;
import '../src/domain/repositories/road_bridge/road_bridge_repo.dart' as _i18;
import '../src/domain/repositories/user/user_repo.dart' as _i23;
import '../src/domain/use_cases/home/get_banner.dart' as _i27;
import '../src/domain/use_cases/home/get_news.dart' as _i29;
import '../src/domain/use_cases/home/get_running_text.dart' as _i32;
import '../src/domain/use_cases/report/delete_bridge_report.dart' as _i25;
import '../src/domain/use_cases/report/delete_road_report.dart' as _i26;
import '../src/domain/use_cases/report/get_bridge_report_data.dart' as _i28;
import '../src/domain/use_cases/report/get_road_report_data.dart' as _i31;
import '../src/domain/use_cases/report/send_bridge_report.dart' as _i20;
import '../src/domain/use_cases/report/send_road_report.dart' as _i21;
import '../src/domain/use_cases/road_bridge/get_road_data.dart' as _i30;
import '../src/domain/use_cases/user/login.dart' as _i37;
import '../src/domain/use_cases/user/logout.dart' as _i33;
import '../src/domain/use_cases/user/register.dart' as _i38;
import '../src/presentation/auth/manager/auth_cubit.dart' as _i39;
import '../src/presentation/home/manager/banner/banner_cubit.dart' as _i40;
import '../src/presentation/home/manager/news/news_cubit.dart' as _i34;
import '../src/presentation/home/manager/running_text/running_text_cubit.dart'
    as _i36;
import '../src/presentation/report/manager/report_cubit.dart' as _i35;
import 'injectable_module.dart' as _i41; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i4.FCMHelper>(() => _i4.FCMHelper());
  gh.lazySingleton<_i5.HiveInterface>(() => injectableModule.hiveInterface);
  gh.lazySingleton<_i6.Location>(() => injectableModule.location);
  gh.lazySingleton<_i7.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i8.UserLocalDataSrc>(
      () => _i8.UserLocalDataHive(get<_i5.HiveInterface>()));
  gh.lazySingleton<_i9.UserLocationData>(
      () => _i9.UserLocationDataImpl(location: get<_i6.Location>()));
  gh.lazySingleton<_i10.ApiClient>(
      () => _i10.ApiClient(get<_i3.Dio>(), get<_i7.Logger>()));
  gh.lazySingleton<_i11.HomeRemoteDataSrc>(
      () => _i11.HomeRemoteDataSrcImpl(get<_i10.ApiClient>()));
  gh.lazySingleton<_i12.HomeRepo>(
      () => _i13.HomeRepoImpl(get<_i11.HomeRemoteDataSrc>()));
  gh.lazySingleton<_i14.ReportRemoteDataSrc>(
      () => _i14.ReportDataSrcImpl(get<_i10.ApiClient>()));
  gh.lazySingleton<_i15.ReportRepo>(
      () => _i16.ReportRepoImpl(get<_i14.ReportRemoteDataSrc>()));
  gh.lazySingleton<_i17.RoadBridgeRemoteDataSrc>(
      () => _i17.RoadBridgeDataSrcImpl(get<_i10.ApiClient>()));
  gh.lazySingleton<_i18.RoadBridgeRepo>(
      () => _i19.RoadBridgeRepoImpl(get<_i17.RoadBridgeRemoteDataSrc>()));
  gh.lazySingleton<_i20.SendBridgeReport>(
      () => _i20.SendBridgeReport(get<_i15.ReportRepo>()));
  gh.lazySingleton<_i21.SendRoadReport>(
      () => _i21.SendRoadReport(get<_i15.ReportRepo>()));
  gh.lazySingleton<_i22.UserRemoteDataSrc>(
      () => _i22.UserRemoteDataSrcImpl(get<_i10.ApiClient>()));
  gh.lazySingleton<_i23.UserRepo>(() => _i24.UserRepoImpl(
      get<_i22.UserRemoteDataSrc>(), get<_i8.UserLocalDataSrc>()));
  gh.lazySingleton<_i25.DeleteBridgeReport>(
      () => _i25.DeleteBridgeReport(get<_i15.ReportRepo>()));
  gh.lazySingleton<_i26.DeleteRoadReport>(
      () => _i26.DeleteRoadReport(get<_i15.ReportRepo>()));
  gh.lazySingleton<_i27.GetBanner>(() => _i27.GetBanner(get<_i12.HomeRepo>()));
  gh.lazySingleton<_i28.GetBridgeReportData>(
      () => _i28.GetBridgeReportData(get<_i15.ReportRepo>()));
  gh.lazySingleton<_i29.GetNews>(() => _i29.GetNews(get<_i12.HomeRepo>()));
  gh.lazySingleton<_i30.GetRoadData>(
      () => _i30.GetRoadData(get<_i18.RoadBridgeRepo>()));
  gh.lazySingleton<_i31.GetRoadReportData>(
      () => _i31.GetRoadReportData(get<_i15.ReportRepo>()));
  gh.lazySingleton<_i32.GetRunningText>(
      () => _i32.GetRunningText(get<_i12.HomeRepo>()));
  gh.lazySingleton<_i33.Logout>(() => _i33.Logout(get<_i23.UserRepo>()));
  gh.factory<_i34.NewsCubit>(() => _i34.NewsCubit(get<_i29.GetNews>()));
  gh.factory<_i35.ReportCubit>(() => _i35.ReportCubit(
      get<_i21.SendRoadReport>(),
      get<_i20.SendBridgeReport>(),
      get<_i31.GetRoadReportData>(),
      get<_i28.GetBridgeReportData>(),
      get<_i26.DeleteRoadReport>(),
      get<_i25.DeleteBridgeReport>()));
  gh.factory<_i36.RunningTextCubit>(
      () => _i36.RunningTextCubit(get<_i32.GetRunningText>()));
  gh.lazySingleton<_i37.UserLogin>(() => _i37.UserLogin(get<_i23.UserRepo>()));
  gh.lazySingleton<_i38.UserRegister>(
      () => _i38.UserRegister(get<_i23.UserRepo>()));
  gh.factory<_i39.AuthCubit>(() => _i39.AuthCubit(
      login: get<_i37.UserLogin>(),
      register: get<_i38.UserRegister>(),
      fcmHelper: get<_i4.FCMHelper>()));
  gh.factory<_i40.BannerCubit>(() => _i40.BannerCubit(get<_i27.GetBanner>()));
  return get;
}

class _$InjectableModule extends _i41.InjectableModule {}
