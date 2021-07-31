import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/route/route.gr.dart';
import 'core/utils/const.dart';
import 'cubit_observer.dart';
import 'injection/injection.dart';
import 'src/data/data_sources/user/user_local_data_src.dart';
import 'src/data/models/user/user_model.dart';

void main() async {
  await Hive.initFlutter();
  await Firebase.initializeApp();
  Bloc.observer = CubitObserver();
  configureDependencies();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox(userDataCacheBox);

  final _appRouter = AppRouter();

  await initializeDateFormatting();

  runApp(ScreenUtilInit(
    designSize: Size(360, 640),
    builder: () => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    ),
  ));
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 1000), () {
        late PageRouteInfo route;
        if (sl<UserLocalDataSrc>().isLogin()) {
          route = HomePageRoute();
        } else {
          route = LoginPageRoute();
        }
        context.router.replace(route);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
