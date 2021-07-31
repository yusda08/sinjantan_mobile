import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/core/utils/navigator_helper.dart';
import 'package:sijantan/src/data/data_sources/road_bridge/road_bridge_remote_data_src.dart';
import 'package:sijantan/src/data/models/report/bridge_report_model.dart';
import 'package:sijantan/src/data/models/report/road_report_model.dart';
import 'package:sijantan/ui/widgets/photo_view_page.dart';

class DetailPengaduanPage extends StatelessWidget {
  final dynamic reportDetail;

  DetailPengaduanPage(this.reportDetail);

  final h1 = AppTextStyle.poppinsBold(fontSize: 14.sp, color: grey1);

  final h2 = AppTextStyle.poppinsSemiBold(fontSize: 12.sp, color: grey2);

  final h2White = AppTextStyle.poppinsSemiBold(fontSize: 12.sp, color: white);

  final tx1 = AppTextStyle.poppinsReg(fontSize: 12.sp, color: grey2);

  final tx2 = AppTextStyle.poppinsReg(fontSize: 10.sp, color: grey2);

  final borderSide = BorderSide(width: 1, color: grey5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey6,
      appBar: AppBar(
        title: Text('DETAIL PENGADUAN',
            style: AppTextStyle.poppinsBold(fontSize: 14.sp, color: white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRincianPengaduan(),
            SizedBox(height: 14.h),
            _buildDescPengaduan(),
            SizedBox(height: 14.h),
            _buildImgPengaduan(context),
            SizedBox(height: 14.h),
            _buildRespPengaduan(),
          ],
        ),
      ),
    );
  }

  Widget _buildRincianPengaduan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RINCIAN PENGADUAN', style: h1),
        SizedBox(height: 6.h),
        Container(
          width: 1.sw,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: grey5, width: 1),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tiket', style: h2),
                      Text('Tanggal', style: h2),
                      Text(
                          '${reportDetail is RoadReportDataModel ? 'Jalan' : 'Jembatan'}',
                          style: h2),
                      Text('Status', style: h2),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(': ${reportDetail.reportTicket}', style: tx1),
                        Text(': ${reportDetail.reportDate}', style: tx1),
                        Text(
                            ': ${reportDetail is RoadReportDataModel ? reportDetail.roadName : reportDetail.bridgeName}',
                            style: tx1),
                        Row(
                          children: [
                            Text(': ', style: tx1),
                            Text(
                                reportDetail.responseStatus == '0'
                                    ? 'Menunggu Tanggapan'
                                    : 'Telah Ditanggapi',
                                style: tx1.copyWith(
                                    color: reportDetail.responseStatus == '0'
                                        ? Colors.orange
                                        : Colors.blue)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescPengaduan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DESKRIPSI PENGADUAN', style: h1),
        SizedBox(height: 6.h),
        Container(
          width: 1.sw,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: grey5, width: 1),
          ),
          child: Text(reportDetail.reportText, style: tx1),
        )
      ],
    );
  }

  Widget _buildImgPengaduan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BUKTI PENGADUAN', style: h1),
        SizedBox(height: 6.h),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  push(
                      context,
                      PhotoViewPage(reportDetail.reportAssets[0].photoPath +
                          '/' +
                          reportDetail.reportAssets[0].photoName));
                },
                child: CachedNetworkImage(
                  imageUrl: reportDetail.reportAssets[0].photoPath +
                      '/' +
                      reportDetail.reportAssets[0].photoNameThumb,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  push(
                      context,
                      PhotoViewPage(reportDetail.reportAssets[1].photoPath +
                          '/' +
                          reportDetail.reportAssets[1].photoName));
                },
                child: CachedNetworkImage(
                  imageUrl: reportDetail.reportAssets[1].photoPath +
                      '/' +
                      reportDetail.reportAssets[1].photoNameThumb,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  push(
                      context,
                      PhotoViewPage(reportDetail.reportAssets[2].photoPath +
                          '/' +
                          reportDetail.reportAssets[2].photoName));
                },
                child: CachedNetworkImage(
                  imageUrl: reportDetail.reportAssets[2].photoPath +
                      '/' +
                      reportDetail.reportAssets[2].photoNameThumb,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRespPengaduan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TANGGAPAN PENGADUAN', style: h1),
        SizedBox(height: 6.h),
        if (reportDetail.reportResponse.length == 0)
          Container(
            width: 1.sw,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: grey5, width: 1),
            ),
            child: Text('Belum ada tanggapan', style: tx1),
          ),
        for (int i = 0; i < reportDetail.reportResponse.length; i++)
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Column(
              children: [
                Container(
                  width: 1.sw,
                  color: grey2,
                  padding: EdgeInsets.all(12.w),
                  child: Text(
                      reportDetail.reportResponse[i].responseDate.toString(),
                      style: h2White),
                ),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      color: white,
                      border: Border(
                          bottom: borderSide,
                          left: borderSide,
                          right: borderSide)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(reportDetail.reportResponse[i].responseText,
                          style: tx1),
                      // Divider(),
                    ],
                  ),
                ),
                Container(
                  width: 1.sw,
                  padding:
                      EdgeInsets.symmetric(vertical: 6.w, horizontal: 12.w),
                  decoration: BoxDecoration(
                      color: white,
                      border: Border(
                          bottom: borderSide,
                          left: borderSide,
                          right: borderSide)),
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.blue, radius: 5.w),
                      SizedBox(width: 10.w),
                      Text('Admin', style: tx2),
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
