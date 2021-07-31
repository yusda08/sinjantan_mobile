import 'package:auto_route/auto_route.dart';
import 'package:sijantan/src/presentation/auth/pages/login_page.dart';
import 'package:sijantan/src/presentation/auth/pages/register_page.dart';
import 'package:sijantan/src/presentation/home/pages/banner_detail_page.dart';
import 'package:sijantan/src/presentation/home/pages/home_page.dart';
import 'package:sijantan/src/presentation/home/pages/news_page.dart';
import 'package:sijantan/src/presentation/report/pages/bridge/bridge_report_form_page.dart';
import 'package:sijantan/src/presentation/report/pages/road/road_report_form_page.dart';
import 'package:sijantan/src/presentation/report/pages/my_pengaduan_page.dart';

import '../../main.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  CustomRoute(
    page: LoadingPage,
    initial: true,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  AutoRoute(page: LoginPage),
  AutoRoute(page: RegisterPage),
  AutoRoute(page: HomePage),
  CupertinoRoute(page: MyPengaduanPage),
  CupertinoRoute(page: RoadReportFormPage),
  CupertinoRoute(page: BridgeReportFormPage),
  CupertinoRoute(page: NewsPage),
  CupertinoRoute(page: BannerDetailPage),
  // CustomRoute(
  //   page: SearchPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: EditProfilePage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),  CustomRoute(
  //   page: AuthPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: ContributorDetailPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: ChangePassPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: ProductDetailPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: StoreViewPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: BannerDetail,
  //   transitionsBuilder: TransitionsBuilders.zoomIn,
  // ),
  // CustomRoute(
  //   page: AboutAppPage,
  //   transitionsBuilder: TransitionsBuilders.zoomIn,
  // ),
  // CustomRoute(
  //   page: NotificationPage,
  //   transitionsBuilder: TransitionsBuilders.slideLeft,
  // ),
  // CustomRoute(
  //   page: OpenStoreFormPage,
  //   transitionsBuilder: TransitionsBuilders.slideLeft,
  // ),
  // CustomRoute(
  //   page: NearestProductPage,
  //   transitionsBuilder: TransitionsBuilders.slideLeft,
  // ),CustomRoute(
  //   page: LatestProductPage,
  //   transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
  // ),
  // CustomRoute(
  //   page: AddProductFormPage,
  //   transitionsBuilder: TransitionsBuilders.slideLeft,
  // ),
  // CustomRoute(
  //   page: OnBoardingPage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
  // CustomRoute(
  //   page: HomePage,
  //   transitionsBuilder: TransitionsBuilders.fadeIn,
  // ),
])
class $AppRouter {}
