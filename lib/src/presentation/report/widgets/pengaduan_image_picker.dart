import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/core/utils/image_helper.dart';
import 'package:sijantan/core/utils/reusable_widgets.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/data/data_sources/user/user_location_data.dart';
import 'package:sijantan/src/data/models/road_bridge/road_bridge_file.dart';

class PengaduanImagePicker extends StatefulWidget {
  final File? image;

  // final RoadModel road;

  PengaduanImagePicker(this.image);

  @override
  _PengaduanImagePickerState createState() => _PengaduanImagePickerState();
}

class _PengaduanImagePickerState extends State<PengaduanImagePicker> {
  final ImagePicker _picker = ImagePicker();
  final GlobalKey _globalKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();

  File? _imagePickerFile;

  // RoadBridgeFile? _imagePickerFile;
  LatLng? _imageLatLng;
  String? _waterMark;
  bool isExifValid = true;
  bool showLocationPicker = false;

  getImage(ImageSource imageSource) async {
    try {
      _picker
          .pickImage(
              source: imageSource,
              imageQuality: 40,
              preferredCameraDevice: CameraDevice.rear)
          .then((pickedFile) async {
        setState(() {
          if (_waterMark != null) _waterMark = null;
          _imagePickerFile = File(pickedFile!.path);
        });
        await checkImgExif(pickedFile!.path);
        if (imageSource == ImageSource.camera) {
          setState(() => showLocationPicker = false);
          await getGeolocation();
        } else {
          if (!isExifValid) {
            Fluttertoast.showToast(
                msg:
                    'Tidak terdapat lokasi pada gambar, silahkan tentukan lokasi');
          }
          setState(() => showLocationPicker = !isExifValid);
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'Terjadi kesalahan $e');
    }
  }

  Future<void> getGeolocation([LatLng? latLng]) async {
    try {
      final imageExifData =
          await sl<UserLocationData>().getUserPositionAddress(latLng);
      setState(() {
        _imageLatLng = imageExifData.latLng;
        _waterMark =
            '${imageExifData.latLng.latitude},${imageExifData.latLng.longitude},\n${imageExifData.address ?? ''}';
        isExifValid = false;
      });
    } on CustomException catch (e) {
      Fluttertoast.showToast(msg: 'Terjadi kesalahan ${e.message}');
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Terjadi kesalahan $e');
      Navigator.pop(context);
    }
  }

  _renderWidgetToImage() async {
    String msg = '';

    if (_imagePickerFile != null && isExifValid) {
      final objToReturn =
          RoadBridgeFile(image: _imagePickerFile!, imageLatLong: _imageLatLng!);
      Navigator.pop(context, objToReturn);
      return;
    }

    if (_waterMark == null) msg = 'Tentukan Lokasi Photo';
    if (_imagePickerFile == null) msg = 'Photo tidak boleh kosong';

    if (msg.isNotEmpty) {
      Fluttertoast.showToast(msg: msg);
      msg = '';
      return;
    }

    if (_imageLatLng != null) {
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      File imageFile =
          await ImageHelper.widgetToImageFile(boundary, _imageLatLng!);

      final objToReturn =
          RoadBridgeFile(image: imageFile, imageLatLong: _imageLatLng!);

      Navigator.pop(context, objToReturn);
    }
  }

  deleteImage() {
    setState(() {
      isExifValid = false;
      _imagePickerFile = null;
    });
  }

  showImgPickerOption() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: SizedBox(
                height: 100.h,
                width: .5.sw,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: TextButton.icon(
                            icon: Icon(Icons.photo_library),
                            label: Text('Gallery'),
                            onPressed: () {
                              Navigator.pop(context);
                              getImage(ImageSource.gallery);
                            }),
                      ),
                      Expanded(
                        child: TextButton.icon(
                            icon: Icon(Icons.camera),
                            label: Text('Camera'),
                            onPressed: () {
                              Navigator.pop(context);
                              getImage(ImageSource.camera);
                            }),
                      ),
                    ])),
          );
        });
  }

  Future<void> checkImgExif(String imgPath) async {
    var result = await ImageHelper.isExifValid(imgPath);
    print('checkImgExif $result');
    if (result) {
      var latLng = await ImageHelper.getLatLngFromImg(imgPath);
      _imageLatLng = latLng;
    }
    setState(() {
      isExifValid = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _imagePickerFile = widget.image;
    if (_imagePickerFile != null) {
      checkImgExif(_imagePickerFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_imagePickerFile != null && isExifValid) {
          final objToReturn = RoadBridgeFile(
              image: _imagePickerFile!, imageLatLong: _imageLatLng!);
          Navigator.pop(context, objToReturn);
        }
        return Future.value(true);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: ScreenUtil().statusBarHeight),
            Expanded(
              child: Stack(
                children: [
                  _buildImage(),
                  if (_imagePickerFile != null) _buildAction(context),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            if (showLocationPicker)
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: grey6, border: Border.all(width: 3, color: grey5)),
                child: TextButton.icon(
                    icon: Icon(Icons.place),
                    label: Text('SET LOKASI PHOTO'),
                    onPressed: () async {
                      final latLong = await showDialog(
                          context: context, builder: (_) => MapView());
                      getGeolocation(latLong);
                    }),
              ),
            if (_imagePickerFile != null) _buildButton()
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: showImgPickerOption,
      child: Container(
        color: grey5,
        width: 1.sw,
        alignment: Alignment.center,
        child: _imagePickerFile != null
            ? RepaintBoundary(
                key: _globalKey,
                child: Screenshot(
                  controller: screenshotController,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.file(_imagePickerFile!, fit: BoxFit.contain),
                      if (_waterMark != null)
                        Container(
                          color: grey1.withOpacity(0.5),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Opacity(
                                  opacity: .5,
                                  child: Image.asset('assets/logo.png',
                                      scale: 13)),
                              Expanded(
                                child: Text(
                                  _waterMark!,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 8.sp,
                                    shadows: [
                                      BoxShadow(
                                          color: grey2,
                                          blurRadius: 2,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined, size: 50.w),
                  Text('Klik untuk mengambil gambar')
                ],
              ),
      ),
    );
  }

  Widget _buildAction(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Column(
        children: [
          GestureDetector(
            onTap: showImgPickerOption,
            child: Icon(Icons.camera_alt_outlined, size: 20.w),
          ),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              ReusableWidgets.showYesOrNo(context,
                  additionInfo: 'Ingin menghapus gambar?',
                  onTapYes: deleteImage);
            },
            child: Icon(Icons.delete, color: Colors.red, size: 20.w),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return SizedBox(
        height: 45.h,
        child: ElevatedButton(
            onPressed: () {
              _renderWidgetToImage();
            },
            child: Text('SEMATKAN GAMBAR')));
  }
}

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  LatLng? latLongAfterCameraMoving;
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          markers: Set<Marker>.of(_markers.values),
          initialCameraPosition: CameraPosition(target: tapinLatLng, zoom: 17),
          onMapCreated: (controller) {
            setState(() {
              _markers[MarkerId('marker')] = Marker(
                  markerId: MarkerId('marker'),
                  position: tapinLatLng,
                  infoWindow: InfoWindow(title: 'Tentukan lokasi foto'));
              latLongAfterCameraMoving = tapinLatLng;
            });
          },
          onCameraMove: (CameraPosition position) {
            setState(() {
              _markers[MarkerId('marker')] = Marker(
                  position: position.target,
                  markerId: MarkerId('marker'),
                  infoWindow: InfoWindow(title: 'Tentukan lokasi foto'));
              latLongAfterCameraMoving = position.target;
            });
          },
        ),
        Positioned(
            bottom: 5,
            right: 5,
            left: 5,
            child: SizedBox(
                height: 40.h,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.place),
                    onPressed: () {
                      if (latLongAfterCameraMoving != null)
                        Navigator.pop(context, latLongAfterCameraMoving);
                    },
                    label: Text('SIMPAN')))),
        // Positioned(
        //   top: ScreenUtil().statusBarHeight + 10,
        //   right: 15,
        //   left: 15,
        //   child: Container(
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         boxShadow: [BoxShadow(color: grey4, blurRadius: 4)]),
        //     child: Row(
        //       children: <Widget>[
        //         BackButton(),
        //         Expanded(
        //           child: TextField(
        //             cursorColor: Colors.black,
        //             keyboardType: TextInputType.text,
        //             textInputAction: TextInputAction.go,
        //             decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding: EdgeInsets.symmetric(horizontal: 15),
        //                 hintText: "Search..."),
        //             onTap: () async {
        //             },
        //             onSubmitted: (input) {
        //               // keyword = input;
        //               sl<UserLocationData>().getLocationFromAddress(input);
        //             },
        //             onEditingComplete: () {},
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
