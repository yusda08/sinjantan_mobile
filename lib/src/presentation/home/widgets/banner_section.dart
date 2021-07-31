import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/route/route.gr.dart';
import 'package:sijantan/src/data/models/home/banner_model.dart';
import 'package:sijantan/src/presentation/home/manager/banner/banner_cubit.dart';
import 'package:sijantan/src/presentation/home/pages/banner_detail_page.dart';
import 'package:sijantan/src/presentation/widgets/banner_shimmer.dart';
import 'package:auto_route/auto_route.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          return state.maybeWhen(
            bannerLoaded: (listBanner) {
              return PageView.builder(
                controller: PageController(),
                onPageChanged: (pageIndex) {},
                itemCount: 2,
                itemBuilder: (context, index) {
                  return BannerItemWidget(data: listBanner[index]);
                },
              );
            },
            loading: () => BannerShimmer(),
            orElse: () => BannerShimmer(),
          );
        },
      ),
    );
  }
}

class BannerItemWidget extends StatelessWidget {
  final BannerModel data;

  const BannerItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(BannerDetailPageRoute(data: data));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: data.bannerId,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.lightBlue, Colors.white])),
                child: CachedNetworkImage(
                  imageUrl: data.fotoPath + '/' + data.fotoName,
                  width: double.infinity,
                  height: 130.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return SizedBox(
                        width: double.infinity,
                        height: 108.w,
                        child: Center(child: CircularProgressIndicator()));
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16),
              height: 60.h,
              child: Text(data.bannerTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.poppinsSemiBold(
                      fontSize: 12.sp, color: white)),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.01),
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
