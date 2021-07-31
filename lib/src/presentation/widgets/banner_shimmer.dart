import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sijantan/core/config/appstyle.dart';

class BannerShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Shimmer.fromColors(
        baseColor: grey5,
        highlightColor: white,
        child: Container(
          width: double.infinity,
          height: 130.h,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
