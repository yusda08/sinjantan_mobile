import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/src/data/models/home/banner_model.dart';
import 'package:sijantan/src/data/models/home/news_model.dart';

class BannerDetailPage extends StatelessWidget {
  final BannerModel data;

  const BannerDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h1 = AppTextStyle.poppinsBold(fontSize: 14.sp, color: grey1);

    final h2 = AppTextStyle.poppinsSemiBold(fontSize: 12.sp, color: grey2);

    final h2White = AppTextStyle.poppinsSemiBold(fontSize: 12.sp, color: white);

    final tx1 = AppTextStyle.poppinsReg(fontSize: 12.sp, color: grey2);

    final tx2 = AppTextStyle.poppinsReg(fontSize: 10.sp, color: grey2);

    final borderSide = BorderSide(width: 1, color: grey5);

    return Scaffold(
      appBar: AppBar(
          title: Text('BERITA',
              style: AppTextStyle.poppinsBold(fontSize: 14.sp, color: white))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.bannerTitle, style: h1),
            Text(DateFormat.yMMMMEEEEd('id').format(data.createAt), style: tx2),
            Divider(),
            Text(data.bannerContent, style: tx1),
          ],
        ),
      ),
    );
  }
}
