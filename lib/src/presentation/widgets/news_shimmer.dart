import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sijantan/core/config/appstyle.dart';

class NewsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(bottom: 25, top: 10, right: 8),
        elevation: 3.5,
        child: Shimmer.fromColors(
          baseColor: grey5,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: .7.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10.h,
                  width: .2.sw,
                  color: grey4,
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                  height: 10.h,
                  width: .4.sw,
                  color: grey4,
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                  height: 10.h,
                  width: .6.sw,
                  color: grey4,
                  margin: EdgeInsets.only(top: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
