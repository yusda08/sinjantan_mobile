import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/core/config/appstyle.dart';

import 'form_helper.dart';

class ReusableWidgets {
  // static showLoadingOverlay(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return Dialog(shape: CircleBorder(), child: loadingLogo());
  //       });
  // }

  // static Widget loadingLogo() => Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         Container(
  //             width: .25.sw,
  //             height: .25.sw,
  //             padding: EdgeInsets.only(
  //                 top: .05.sw, left: .05.sw, right: .05.sw, bottom: .07.sw),
  //             decoration:
  //                 ShapeDecoration(color: Colors.white, shape: CircleBorder()),
  //             child: SvgPicture.asset(icLogo)),
  //         SizedBox(
  //             width: .25.sw,
  //             height: .25.sw,
  //             child: CircularProgressIndicator()),
  //       ],
  //     );

  static showYesOrNo(BuildContext context,
      {String? additionInfo, required VoidCallback onTapYes}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Apakah Anda yakin?\n${additionInfo ?? ''}',
          style: TextStyle(
              fontSize: 14.sp, color: Color(0xff070A2B), fontFamily: 'MuliReg'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:
                Text('Batal', style: AppTextStyle.poppinsMed(fontSize: 12.sp)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              onTapYes();
            },
            child: Text('Ya', style: AppTextStyle.poppinsMed(fontSize: 12.sp)),
          ),
        ],
      ),
    );
  }

// static showDialogBoxForLogout(BuildContext context,
//     {VoidCallback actionForYes}) {
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       titleTextStyle: AppTextStyle.ralewayBold(fontSize: 16.sp),
//       contentTextStyle: AppTextStyle.ralewayMed(fontSize: 12.sp),
//       title: Text('Logout'),
//       content: Text('Apakah Anda Yakin?'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(false),
//           child: Text('Batal'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//             actionForYes();
//           },
//           child: Text('Iya'),
//         ),
//       ],
//     ),
//   );
// }
}
