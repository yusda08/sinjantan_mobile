import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/src/data/models/user/user_model.dart';

abstract class UserLocalDataSrc {
  UserModel? getData();

  bool isLogin();

  void cacheUserData(UserModel userDataToCache);

  void deleteCache();
}

@LazySingleton(as: UserLocalDataSrc)
class UserLocalDataHive implements UserLocalDataSrc {
  final HiveInterface _hive;

  UserLocalDataHive(this._hive);

  @override
  UserModel? getData() {
    final box = _hive.box(userDataCacheBox);
    final UserModel? userDataCache = box.get(userDataCacheKey);
    return userDataCache;
  }

  @override
  void cacheUserData(UserModel userDataToCache) {
    try {
      final box = _hive.box(userDataCacheBox);
      box.put(userDataCacheKey, userDataToCache);
    } catch (ex) {
      print('usercacheData ${ex.runtimeType}');
    }
  }

  @override
  void deleteCache() {
    final box = _hive.box(userDataCacheBox);
    box.delete(userDataCacheKey);
  }

  @override
  bool isLogin() => getData() != null;
}
