import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/route/route.gr.dart';
import 'package:sijantan/core/utils/form_helper.dart';
import 'package:sijantan/core/utils/form_validator.dart';
import 'package:sijantan/core/utils/reusable_widgets.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/presentation/auth/manager/auth_cubit.dart';

class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  _LoginPageState createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (_) => sl<AuthCubit>(), child: this);
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _validateMode = AutovalidateMode.disabled;
  final _passIsHide = ValueNotifier<bool>(true);

  final emailTxController = TextEditingController();
  final passTxController = TextEditingController();

  _loginAction() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _validateMode = AutovalidateMode.always);
      Future.delayed(Duration(seconds: 1), () => unFocusTextField(context));
    } else {
      _formKey.currentState!.save();
      final formData = LoginRequestObject(
        email: emailTxController.text,
        password: passTxController.text,
      );
      context.read<AuthCubit>().login(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.w),
            width: 1.sw,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  Fluttertoast.showToast(
                      msg: state.message, backgroundColor: Colors.red);
                  unFocusTextField(context);
                }
                if (state is AuthSuccess) {
                  Fluttertoast.showToast(
                      msg: state.message, backgroundColor: greenPrimary);
                  context.router.replace(HomePageRoute());
                }
              },
              builder: (context, state) {
                bool _formEnable = state is! AuthLoading;
                bool _isLoading = state is AuthLoading;
                return Form(
                  key: _formKey,
                  autovalidateMode: _validateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Image.asset('assets/logo.png', scale: 5),
                      SizedBox(height: 10.h),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Aplikasi Pengaduan\n',
                                  style: AppTextStyle.poppinsBold(
                                      fontSize: 18.sp)),
                              TextSpan(
                                  text: 'Jalan dan Jembatan Kabupaten Tapin',
                                  style:
                                      AppTextStyle.poppinsReg(fontSize: 12.sp)),
                            ],
                          ),
                          textAlign: TextAlign.center),
                      SizedBox(height: 20.h),
                      TextFormField(
                        enabled: _formEnable,
                        controller: emailTxController,
                        validator: emailValidator,
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15.h),
                      ValueListenableBuilder<bool>(
                        valueListenable: _passIsHide,
                        builder: (context, value, child) {
                          return TextFormField(
                              enabled: _formEnable,
                              controller: passTxController,
                              validator: passwordValidator,
                              obscureText: _passIsHide.value,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () => _passIsHide.value =
                                          !_passIsHide.value)));
                        },
                      ),
                      SizedBox(height: 15.h),
                      _isLoading
                          ? CircularProgressIndicator()
                          : Container(
                              height: 40.h,
                              width: 1.sw,
                              child: ElevatedButton(
                                child: Text('LOGIN'),
                                style: ElevatedButton.styleFrom(
                                    textStyle: AppTextStyle.poppinsMed(
                                        fontSize: 12.sp),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  ReusableWidgets.showYesOrNo(context,
                                      onTapYes: () {
                                    _loginAction();
                                  });
                                },
                              ),
                            ),
                      SizedBox(height: 10.h),
                      Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: 'Belum punya akun?',
                                style:
                                    AppTextStyle.poppinsReg(fontSize: 12.sp)),
                            TextSpan(
                                text: ' Buat akun',
                                style:
                                    AppTextStyle.poppinsBold(fontSize: 12.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router.replace(RegisterPageRoute());
                                  })
                          ]),
                          textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
