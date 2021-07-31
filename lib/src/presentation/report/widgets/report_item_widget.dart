import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/utils/navigator_helper.dart';
import 'package:sijantan/src/data/models/report/road_report_model.dart';
import 'package:sijantan/src/presentation/report/manager/report_cubit.dart';

import '../pages/detail_pengaduan_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportItemWidget extends StatelessWidget {
  final dynamic reportItem;

  const ReportItemWidget({Key? key, required this.reportItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            push(context, DetailPengaduanPage(reportItem));
          },
          child: Container(
            width: .7.sw,
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tiket : ${reportItem.reportTicket}',
                            style: AppTextStyle.poppinsReg(fontSize: 10.sp)),
                        Text(
                            '${reportItem is RoadReportDataModel ? reportItem.roadName : reportItem.bridgeName}',
                            style: AppTextStyle.poppinsBold(fontSize: 12.sp)),
                      ],
                    ),
                    PopupMenuButton(
                      iconSize: 25,
                      child: Icon(Icons.adaptive.more),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 5),
                              GestureDetector(
                                  onTap: () {
                                    if (reportItem is RoadReportDataModel)
                                      context
                                          .read<ReportCubit>()
                                          .deleteRoadReport(
                                              reportItem.reportTicket);
                                    else
                                      context
                                          .read<ReportCubit>()
                                          .deleteBridgeReport(
                                              reportItem.reportTicket);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Hapus')),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text('Ket : ${reportItem.reportText}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyle.poppinsReg(fontSize: 10.sp)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: reportItem.reportAssets[0].photoPath +
                            '/' +
                            reportItem.reportAssets[0].photoNameThumb,
                        height: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: reportItem.reportAssets[1].photoPath +
                            '/' +
                            reportItem.reportAssets[1].photoNameThumb,
                        height: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: reportItem.reportAssets[2].photoPath +
                            '/' +
                            reportItem.reportAssets[2].photoNameThumb,
                        height: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                    height: 30.w,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      reportItem.responseStatus == '0'
                          ? 'Belum Ditanggapi'
                          : 'Telah Ditanggapi',
                      style: AppTextStyle.poppinsBold(
                          fontSize: 10.sp, color: white),
                    ),
                    decoration: BoxDecoration(
                        color: reportItem.responseStatus == '0'
                            ? Colors.orange
                            : Colors.blue))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
