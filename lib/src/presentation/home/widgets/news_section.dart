import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijantan/core/api/response/home/news_resp.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/route/route.gr.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/data/data_sources/home/home_data_src.dart';
import 'package:sijantan/src/data/models/home/news_model.dart';
import 'package:sijantan/src/presentation/home/manager/news/news_cubit.dart';
import 'package:sijantan/src/presentation/widgets/news_shimmer.dart';
import 'package:auto_route/auto_route.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Berita', style: AppTextStyle.poppinsMed(fontSize: 12.sp)),
              Text('Lihat Semua',
                  style: AppTextStyle.poppinsReg(
                      fontSize: 10.sp, color: Colors.blue)),
            ],
          ),
        ),
        Container(
          height: 120.h,
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              var loading = ListView(
                padding: const EdgeInsets.only(left: 16.0),
                scrollDirection: Axis.horizontal,
                children: [NewsShimmer(), NewsShimmer()],
              );
              return state.maybeWhen(
                  loading: () => loading,
                  newsLoaded: (data) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(left: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (ctx, index) =>
                          NewsItemWidget(data: data[index]),
                    );
                  },
                  orElse: () => loading);
            },
          ),
        )
      ],
    );
  }
}

class NewsItemWidget extends StatelessWidget {
  final NewsModel data;

  const NewsItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(NewsPageRoute(data: data)),
      child: Card(
        margin: EdgeInsets.only(bottom: 25, top: 10, right: 8),
        elevation: 3.5,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: .7.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMEEEEd('id').format(data.newsDate),
                  style: AppTextStyle.poppinsReg(fontSize: 10.sp)),
              Text(data.newsTitle,
                  style: AppTextStyle.poppinsBold(fontSize: 12.sp)),
              Text(data.newsContent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppTextStyle.poppinsMed(fontSize: 10.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
