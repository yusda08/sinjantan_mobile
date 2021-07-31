import 'package:google_maps_flutter/google_maps_flutter.dart';

// const String kBaseUrl = "http://172.17.10.30/sijantan/api/";
const String kBaseUrl = "http://192.168.1.9/sijantan/api/";
// const String kBaseUrl = "http://192.168.1.6/sijantan/api/";

const String userDataCacheBox = 'USER_DATA_BOX';
const String userDataCacheKey = 'USER_DATA_CACHE_KEY';

const LatLng tapinLatLng = LatLng(-2.9309958386692414, 115.15535912550482);

abstract class ApiRespConst {
  static final String registerSuccess = "Berhasil Register Silahkan Cek Email";
  static final String jalanRequired = 'Jalan tidak boleh kosong';
  static final String pickJalanFirst = 'Silakan pilih jalan terlebih dahulu';
  static final String imgMin3 = 'Gambar minimal 3';
  static final String defaultError = 'Terjadi kesalahan';
}

abstract class ExpMsg {
  static final String locationExp = "Berhasil Register Silahkan Cek Email";
}
