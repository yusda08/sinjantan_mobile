// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../main.dart' as _i3;
import '../../src/data/models/home/banner_model.dart' as _i13;
import '../../src/data/models/home/news_model.dart' as _i12;
import '../../src/presentation/auth/pages/login_page.dart' as _i4;
import '../../src/presentation/auth/pages/register_page.dart' as _i5;
import '../../src/presentation/home/pages/banner_detail_page.dart' as _i11;
import '../../src/presentation/home/pages/home_page.dart' as _i6;
import '../../src/presentation/home/pages/news_page.dart' as _i10;
import '../../src/presentation/report/pages/bridge/bridge_report_form_page.dart'
    as _i9;
import '../../src/presentation/report/pages/my_pengaduan_page.dart' as _i7;
import '../../src/presentation/report/pages/road/road_report_form_page.dart'
    as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoadingPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.LoadingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false),
    LoginPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.LoginPage();
        }),
    RegisterPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.RegisterPage();
        }),
    HomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.HomePage();
        }),
    MyPengaduanPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.MyPengaduanPage();
        }),
    RoadReportFormPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.RoadReportFormPage();
        }),
    BridgeReportFormPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.BridgeReportFormPage();
        }),
    NewsPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<NewsPageRouteArgs>();
          return _i10.NewsPage(key: args.key, data: args.data);
        }),
    BannerDetailPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<BannerDetailPageRouteArgs>();
          return _i11.BannerDetailPage(key: args.key, data: args.data);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoadingPageRoute.name, path: '/'),
        _i1.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i1.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i1.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i1.RouteConfig(MyPengaduanPageRoute.name, path: '/my-pengaduan-page'),
        _i1.RouteConfig(RoadReportFormPageRoute.name,
            path: '/road-report-form-page'),
        _i1.RouteConfig(BridgeReportFormPageRoute.name,
            path: '/bridge-report-form-page'),
        _i1.RouteConfig(NewsPageRoute.name, path: '/news-page'),
        _i1.RouteConfig(BannerDetailPageRoute.name, path: '/banner-detail-page')
      ];
}

class LoadingPageRoute extends _i1.PageRouteInfo {
  const LoadingPageRoute() : super(name, path: '/');

  static const String name = 'LoadingPageRoute';
}

class LoginPageRoute extends _i1.PageRouteInfo {
  const LoginPageRoute() : super(name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

class RegisterPageRoute extends _i1.PageRouteInfo {
  const RegisterPageRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

class MyPengaduanPageRoute extends _i1.PageRouteInfo {
  const MyPengaduanPageRoute() : super(name, path: '/my-pengaduan-page');

  static const String name = 'MyPengaduanPageRoute';
}

class RoadReportFormPageRoute extends _i1.PageRouteInfo {
  const RoadReportFormPageRoute() : super(name, path: '/road-report-form-page');

  static const String name = 'RoadReportFormPageRoute';
}

class BridgeReportFormPageRoute extends _i1.PageRouteInfo {
  const BridgeReportFormPageRoute()
      : super(name, path: '/bridge-report-form-page');

  static const String name = 'BridgeReportFormPageRoute';
}

class NewsPageRoute extends _i1.PageRouteInfo<NewsPageRouteArgs> {
  NewsPageRoute({_i2.Key? key, required _i12.NewsModel data})
      : super(name,
            path: '/news-page', args: NewsPageRouteArgs(key: key, data: data));

  static const String name = 'NewsPageRoute';
}

class NewsPageRouteArgs {
  const NewsPageRouteArgs({this.key, required this.data});

  final _i2.Key? key;

  final _i12.NewsModel data;
}

class BannerDetailPageRoute
    extends _i1.PageRouteInfo<BannerDetailPageRouteArgs> {
  BannerDetailPageRoute({_i2.Key? key, required _i13.BannerModel data})
      : super(name,
            path: '/banner-detail-page',
            args: BannerDetailPageRouteArgs(key: key, data: data));

  static const String name = 'BannerDetailPageRoute';
}

class BannerDetailPageRouteArgs {
  const BannerDetailPageRouteArgs({this.key, required this.data});

  final _i2.Key? key;

  final _i13.BannerModel data;
}
