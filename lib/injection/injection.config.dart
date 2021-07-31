// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i5;
import 'package:logger/logger.dart' as _i6;

import '../core/api/api_client.dart' as _i9;
import '../src/data/data_sources/home/home_data_src.dart' as _i10;
import '../src/data/data_sources/report/report_data_src.dart' as _i13;
import '../src/data/data_sources/road_bridge/road_bridge_remote_data_src.dart'
    as _i16;
import '../src/data/data_sources/user/user_local_data_src.dart' as _i7;
import '../src/data/data_sources/user/user_location_data.dart' as _i8;
import '../src/data/data_sources/user/user_remote_data_src.dart' as _i21;
import '../src/data/repositories/home_repo/home_repo_impl.dart' as _i12;
import '../src/data/repositories/pengaduan/road_bridge_repo_impl.dart' as _i15;
import '../src/data/repositories/road_bridge/road_bridge_repo_impl.dart'
    as _i18;
import '../src/data/repositories/user/user_repo_impl.dart' as _i23;
import '../src/domain/repositories/home_repo/home_repo.dart' as _i11;
import '../src/domain/repositories/pengaduan/report_repo.dart' as _i14;
import '../src/domain/repositories/road_bridge/road_bridge_repo.dart' as _i17;
import '../src/domain/repositories/user/user_repo.dart' as _i22;
import '../src/domain/use_cases/home/get_banner.dart' as _i26;
import '../src/domain/use_cases/home/get_news.dart' as _i28;
import '../src/domain/use_cases/home/get_running_text.dart' as _i31;
import '../src/domain/use_cases/report/delete_bridge_report.dart' as _i24;
import '../src/domain/use_cases/report/delete_road_report.dart' as _i25;
import '../src/domain/use_cases/report/get_bridge_report_data.dart' as _i27;
import '../src/domain/use_cases/report/get_road_report_data.dart' as _i30;
import '../src/domain/use_cases/report/send_bridge_report.dart' as _i19;
import '../src/domain/use_cases/report/send_road_report.dart' as _i20;
import '../src/domain/use_cases/road_bridge/get_road_data.dart' as _i29;
import '../src/domain/use_cases/user/login.dart' as _i36;
import '../src/domain/use_cases/user/logout.dart' as _i32;
import '../src/domain/use_cases/user/register.dart' as _i37;
import '../src/presentation/auth/manager/auth_cubit.dart' as _i38;
import '../src/presentation/home/manager/banner/banner_cubit.dart' as _i39;
import '../src/presentation/home/manager/news/news_cubit.dart' as _i33;
import '../src/presentation/home/manager/running_text/running_text_cubit.dart'
    as _i35;
import '../src/presentation/report/manager/report_cubit.dart' as _i34;
import 'injectable_module.dart' as _i40; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i4.HiveInterface>(() => injectableModule.hiveInterface);
  gh.lazySingleton<_i5.Location>(() => injectableModule.location);
  gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i7.UserLocalDataSrc>(
      () => _i7.UserLocalDataHive(get<_i4.HiveInterface>()));
  gh.lazySingleton<_i8.UserLocationData>(
      () => _i8.UserLocationDataImpl(location: get<_i5.Location>()));
  gh.lazySingleton<_i9.ApiClient>(
      () => _i9.ApiClient(get<_i3.Dio>(), get<_i6.Logger>()));
  gh.lazySingleton<_i10.HomeRemoteDataSrc>(
      () => _i10.HomeRemoteDataSrcImpl(get<_i9.ApiClient>()));
  gh.lazySingleton<_i11.HomeRepo>(
      () => _i12.HomeRepoImpl(get<_i10.HomeRemoteDataSrc>()));
  gh.lazySingleton<_i13.ReportRemoteDataSrc>(
      () => _i13.ReportDataSrcImpl(get<_i9.ApiClient>()));
  gh.lazySingleton<_i14.ReportRepo>(
      () => _i15.ReportRepoImpl(get<_i13.ReportRemoteDataSrc>()));
  gh.lazySingleton<_i16.RoadBridgeRemoteDataSrc>(
      () => _i16.RoadBridgeDataSrcImpl(get<_i9.ApiClient>()));
  gh.lazySingleton<_i17.RoadBridgeRepo>(
      () => _i18.RoadBridgeRepoImpl(get<_i16.RoadBridgeRemoteDataSrc>()));
  gh.lazySingleton<_i19.SendBridgeReport>(
      () => _i19.SendBridgeReport(get<_i14.ReportRepo>()));
  gh.lazySingleton<_i20.SendRoadReport>(
      () => _i20.SendRoadReport(get<_i14.ReportRepo>()));
  gh.lazySingleton<_i21.UserRemoteDataSrc>(
      () => _i21.UserRemoteDataSrcImpl(get<_i9.ApiClient>()));
  gh.lazySingleton<_i22.UserRepo>(() => _i23.UserRepoImpl(
      get<_i21.UserRemoteDataSrc>(), get<_i7.UserLocalDataSrc>()));
  gh.lazySingleton<_i24.DeleteBridgeReport>(
      () => _i24.DeleteBridgeReport(get<_i14.ReportRepo>()));
  gh.lazySingleton<_i25.DeleteRoadReport>(
      () => _i25.DeleteRoadReport(get<_i14.ReportRepo>()));
  gh.lazySingleton<_i26.GetBanner>(() => _i26.GetBanner(get<_i11.HomeRepo>()));
  gh.lazySingleton<_i27.GetBridgeReportData>(
      () => _i27.GetBridgeReportData(get<_i14.ReportRepo>()));
  gh.lazySingleton<_i28.GetNews>(() => _i28.GetNews(get<_i11.HomeRepo>()));
  gh.lazySingleton<_i29.GetRoadData>(
      () => _i29.GetRoadData(get<_i17.RoadBridgeRepo>()));
  gh.lazySingleton<_i30.GetRoadReportData>(
      () => _i30.GetRoadReportData(get<_i14.ReportRepo>()));
  gh.lazySingleton<_i31.GetRunningText>(
      () => _i31.GetRunningText(get<_i11.HomeRepo>()));
  gh.lazySingleton<_i32.Logout>(() => _i32.Logout(get<_i22.UserRepo>()));
  gh.factory<_i33.NewsCubit>(() => _i33.NewsCubit(get<_i28.GetNews>()));
  gh.factory<_i34.ReportCubit>(() => _i34.ReportCubit(
      get<_i20.SendRoadReport>(),
      get<_i19.SendBridgeReport>(),
      get<_i30.GetRoadReportData>(),
      get<_i27.GetBridgeReportData>(),
      get<_i25.DeleteRoadReport>(),
      get<_i24.DeleteBridgeReport>()));
  gh.factory<_i35.RunningTextCubit>(
      () => _i35.RunningTextCubit(get<_i31.GetRunningText>()));
  gh.lazySingleton<_i36.UserLogin>(() => _i36.UserLogin(get<_i22.UserRepo>()));
  gh.lazySingleton<_i37.UserRegister>(
      () => _i37.UserRegister(get<_i22.UserRepo>()));
  gh.factory<_i38.AuthCubit>(() => _i38.AuthCubit(
      login: get<_i36.UserLogin>(), register: get<_i37.UserRegister>()));
  gh.factory<_i39.BannerCubit>(() => _i39.BannerCubit(get<_i26.GetBanner>()));
  return get;
}

class _$InjectableModule extends _i40.InjectableModule {}
