import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan/src/presentation/home/manager/running_text/running_text_cubit.dart';

class MarqueWidget extends StatefulWidget {
  const MarqueWidget({Key? key}) : super(key: key);

  @override
  _MarqueWidgetState createState() => _MarqueWidgetState();
}

class _MarqueWidgetState extends State<MarqueWidget> {
  @override
  Widget build(BuildContext context) {
    final textStyle =
        GoogleFonts.openSans(fontSize: 14.sp, color: Colors.white);
    return Container(
      height: 30.h,
      color: Colors.blue,
      alignment: Alignment.center,
      child: BlocBuilder<RunningTextCubit, RunningTextState>(
        builder: (context, state) {
          return state.maybeWhen(
            runningTextLoaded: (data) => Marquee(
              text: data.text + ' ',
              style: textStyle,
            ),
            failure: (msg) => Text(msg, style: textStyle),
            loading: () => Text('Loading...',
                textAlign: TextAlign.center, style: textStyle),
            orElse: () => Text('Error', style: textStyle),
          );
        },
      ),
    );
  }
}
