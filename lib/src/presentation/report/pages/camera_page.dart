import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nil/nil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/core/config/appstyle.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;

  void initCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller?.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });

  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller == null
        ? Container()
        : Scaffold(
            body: SafeArea(
            child: Column(
              children: [
                CameraPreview(
                  controller!,
                  child: Text('asd'),
                ),
                Expanded(
                    child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Simpan', style: TextStyle(color: white)),
                      MaterialButton(
                        height: 40.h,
                        onPressed: () {},
                        shape: CircleBorder(),
                        highlightColor: grey3,
                        color: grey5,
                      ),
                      Text('Sematkan', style: TextStyle(color: white)),
                    ],
                  ),
                ))
              ],
            ),
          ));
  }
}
