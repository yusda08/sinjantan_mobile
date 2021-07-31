import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sijantan/core/api/request/pengaduan/report_req_obj.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/core/utils/form_validator.dart';
import 'package:sijantan/core/utils/reusable_widgets.dart';
import 'package:sijantan/core/utils/toast_helper.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/data/models/road_bridge/road_bridge_file.dart';
import 'package:sijantan/src/presentation/report/manager/report_cubit.dart';
import 'package:sijantan/src/presentation/report/widgets/pengaduan_image_picker.dart';

class RoadReportFormPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  _RoadReportFormPageState createState() => _RoadReportFormPageState();

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (_) => sl<ReportCubit>(), child: this);
}

class _RoadReportFormPageState extends State<RoadReportFormPage> {
  // late Future<RoadDataResponse> getRoadData;
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  final _formKey = GlobalKey<FormState>();

  List<RoadBridgeFile?> _fileImage = List.filled(3, null, growable: false);

  // List<File?> _fileImage = List.filled(3, null, growable: false);
  final txtKetController = TextEditingController();
  final txtRoadNameController = TextEditingController();

  Future<void> animateTo(LatLng position) async {
    final c = await _controller.future;
    final p = CameraPosition(target: position, zoom: 14.4746);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  sendPengaduan() {
    if (_formKey.currentState!.validate()) {
      if (_fileImage.contains(null)) {
        toastDanger(ApiRespConst.imgMin3);
        return;
      }
      final formData = ReportReqObj(
          roadOrBridgeName: txtRoadNameController.text,
          keterangan: txtKetController.text,
          listFile: _fileImage);
      context.read<ReportCubit>().sendRoadReport(formData);
    }
  }

  _requestPermission() async {
    Permission.storage.request();
  }

  @override
  void initState() {
    _requestPermission();
    // getRoadData = sl<RoadBridgeRemoteDataSrc>().getRoadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FORM PENGADUAN JALAN',
            style: AppTextStyle.poppinsBold(fontSize: 14.sp, color: white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _buildMap(),
                // SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Jalan',
                        style: AppTextStyle.poppinsSemiBold(fontSize: 14.sp)),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: txtRoadNameController,
                      validator: defaultValidator,
                      decoration: InputDecoration(
                          labelText: 'Tuliskan nama jalan',
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                _buildKeterangan(),
                SizedBox(height: 12.h),
                _buildImage(context),
                SizedBox(height: 12.h),
                BlocConsumer<ReportCubit, ReportState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        sendReportSuccess: (msg) {
                          Fluttertoast.showToast(msg: msg);
                          context.router.pop();
                        },
                        failure: (msg) {
                          Fluttertoast.showToast(msg: msg);
                        },
                        orElse: () {});
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                        loading: () {
                          return Center(child: CircularProgressIndicator());
                        },
                        orElse: () => Container(
                              height: 40.h,
                              width: 1.sw,
                              child: ElevatedButton(
                                child: Text('KIRIM PENGADUAN'),
                                style: ElevatedButton.styleFrom(
                                    textStyle: AppTextStyle.poppinsSemiBold(
                                        fontSize: 12.sp),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {
                                  ReusableWidgets.showYesOrNo(context,
                                      onTapYes: () {
                                    sendPengaduan();
                                  });
                                },
                              ),
                            ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lampirkan Gambar',
            style: AppTextStyle.poppinsSemiBold(fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_fileImage.length, (index) {
            return GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  final result = await showModalBottomSheet(
                      isScrollControlled: true,
                      enableDrag: false,
                      context: context,
                      builder: (_) {
                        return PengaduanImagePicker(_fileImage[index]?.image);
                        // return MapView();
                      });
                  setState(() => _fileImage[index] = result);
                }
              },
              child: Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: grey5, borderRadius: BorderRadius.circular(10)),
                // ignore: unnecessary_null_comparison
                child: _fileImage[index] != null
                    ? Image.file(_fileImage[index]!.image, fit: BoxFit.contain)
                    : Icon(Icons.camera_alt_outlined, size: 50.r),
              ),
            );
          }),
        ),
      ],
    );
  }

  Column _buildKeterangan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Keterangan',
            style: AppTextStyle.poppinsSemiBold(fontSize: 14.sp)),
        SizedBox(height: 8.h),
        TextFormField(
          controller: txtKetController,
          validator: defaultValidator,
          maxLines: 8,
          decoration: InputDecoration(
              labelText: 'Tuliskan pengaduan anda',
              border: OutlineInputBorder()),
        ),
      ],
    );
  }

  SizedBox _buildMap() {
    return SizedBox(
        height: 200.h,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: tapinLatLng, zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: _markers.values.toSet(),
        ));
  }
//
// Column _buildRoadOption() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Pilih Nama Jalan',
//           style: AppTextStyle.poppinsSemiBold(fontSize: 14.sp)),
//       SizedBox(height: 8.h),
//       FutureBuilder(
//         future: getRoadData,
//         builder:
//             (BuildContext context, AsyncSnapshot<RoadDataResponse> snapshot) {
//           final data = snapshot.data;
//           final error = snapshot.error;
//
//           if (snapshot.hasError)
//             Fluttertoast.showToast(
//                 msg: ExceptionMapper.call(error as Exception));
//
//           return DropdownButtonFormField<RoadModel>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               onChanged: (value) {
//                 if (value != null) {
//                   Marker roadMarker = Marker(
//                       markerId: MarkerId('roadMarker'),
//                       position: LatLng(value.lat, value.long),
//                       infoWindow: InfoWindow(
//                           title: value.roadName,
//                           snippet: '${value.lat}, ${value.long}'));
//                   setState(() {
//                     _roadName = value;
//                     _markers[roadMarker.markerId] = roadMarker;
//                   });
//                   animateTo(LatLng(value.lat, value.long));
//                 }
//               },
//               hint: Text('Pilih Nama Jalan'),
//               items: snapshot.hasData
//                   ? List.generate(
//                       data!.result.length,
//                       (index) => DropdownMenuItem(
//                           child: Text(data.result[index].roadName),
//                           value: data.result[index]))
//                   : [
//                       DropdownMenuItem(child: Text('Loading...'), value: null)
//                     ]);
//         },
//       ),
//     ],
//   );
// }
}
