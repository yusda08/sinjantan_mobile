import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/route/route.gr.dart';
import 'package:sijantan/core/utils/navigator_helper.dart';
import 'package:sijantan/core/utils/reusable_widgets.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/domain/use_cases/user/logout.dart';
import 'package:auto_route/auto_route.dart';

class DrawerWidget extends StatelessWidget {
  BuildContext parentContext;

  DrawerWidget(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .6.sw,
      decoration: BoxDecoration(
          color: grey6,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight + 30.h),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 10),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'), radius: 40.w),
          ),
          Text(
            'Muhammad Sulthan Al Ihsan',
            textAlign: TextAlign.center,
            style:
                AppTextStyle.poppinsBold(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(height: 20.h),
          ItemMenu(
            name: 'Pengaduan Saya',
            icon: Icon(Icons.account_box, size: 25.w),
            onTap: () {
              context.router.push(MyPengaduanPageRoute());
            },
          ),
          ItemMenu(
            name: 'About',
            icon: Icon(Icons.info, size: 25.w),
            onTap: () {},
          ),
          Builder(
            builder: (mainContext) {
              return ItemMenu(
                name: 'Logout',
                icon: Icon(Icons.exit_to_app, size: 25.w),
                onTap: () {
                  ReusableWidgets.showYesOrNo(context, onTapYes: () {
                    sl<Logout>().call();
                    parentContext.replaceRoute(LoginPageRoute());
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  final Icon icon;
  final String name;
  final Function onTap;

  const ItemMenu({
    Key? key,
    required this.icon,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 16),
        height: 40.h,
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Row(
          children: [
            icon,
            SizedBox(width: 10),
            Text(
              name,
              style: AppTextStyle.poppinsBold(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
