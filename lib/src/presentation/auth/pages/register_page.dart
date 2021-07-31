import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/config/appstyle.dart';
import 'package:sijantan/core/route/route.gr.dart';
import 'package:sijantan/core/utils/const.dart';
import 'package:sijantan/core/utils/form_helper.dart';
import 'package:sijantan/core/utils/form_validator.dart';
import 'package:sijantan/core/utils/reusable_widgets.dart';
import 'package:sijantan/injection/injection.dart';
import 'package:sijantan/src/presentation/auth/manager/auth_cubit.dart';

class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  _RegisterPageState createState() => _RegisterPageState();

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (_) => sl<AuthCubit>(), child: this);
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _validateMode = AutovalidateMode.disabled;

  final _pass1IsHide = ValueNotifier<bool>(true);
  final _pass2IsHide = ValueNotifier<bool>(true);

  final nameTxController = TextEditingController();
  final emailTxController = TextEditingController();
  final passTxController = TextEditingController();
  final phoneNumberTxController = TextEditingController();
  final confirmTxController = TextEditingController();

  _regisAction() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _validateMode = AutovalidateMode.always);
      Future.delayed(Duration(seconds: 1), () => unFocusTextField(context));
    } else {
      _formKey.currentState!.save();
      final formData = RegisterRequestObject(
          phoneNumber: phoneNumberTxController.text,
          password: passTxController.text,
          name: nameTxController.text,
          email: emailTxController.text);
      context.read<AuthCubit>().register(formData);
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
                  context.router.replace(LoginPageRoute());
                  Fluttertoast.showToast(
                      msg: ApiRespConst.registerSuccess,
                      backgroundColor: greenPrimary);
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
                        validator: defaultValidator,
                        controller: nameTxController,
                        decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        enabled: _formEnable,
                        validator: emailValidator,
                        controller: emailTxController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        enabled: _formEnable,
                        validator: phoneValidator,
                        controller: phoneNumberTxController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Nomor Telepon',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15.h),
                      ValueListenableBuilder(
                          valueListenable: _pass1IsHide,
                          builder: (context, value, child) {
                            return TextFormField(
                              enabled: _formEnable,
                              controller: passTxController,
                              validator: passwordValidator,
                              obscureText: _pass1IsHide.value,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () => _pass1IsHide.value =
                                          !_pass1IsHide.value),
                                  labelText: 'Password',
                                  border: OutlineInputBorder()),
                            );
                          }),
                      SizedBox(height: 15.h),
                      ValueListenableBuilder(
                          valueListenable: _pass2IsHide,
                          builder: (context, value, child) {
                            return TextFormField(
                              enabled: _formEnable,
                              controller: confirmTxController,
                              obscureText: _pass2IsHide.value,
                              validator: (string) {
                                if (string!.isEmpty)
                                  return 'Tidak Boleh Kosong';
                                return MatchValidator(
                                        errorText: 'Password tidak sesuai')
                                    .validateMatch(confirmTxController.text,
                                        passTxController.text);
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () => _pass2IsHide.value =
                                          !_pass2IsHide.value),
                                  labelText: 'Ulangi Password',
                                  border: OutlineInputBorder()),
                            );
                          }),
                      SizedBox(height: 15.h),
                      _isLoading
                          ? CircularProgressIndicator()
                          : Container(
                              height: 40.h,
                              width: 1.sw,
                              child: ElevatedButton(
                                child: Text('BUAT AKUN'),
                                style: ElevatedButton.styleFrom(
                                    textStyle: AppTextStyle.poppinsMed(
                                        fontSize: 12.sp),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  ReusableWidgets.showYesOrNo(context,
                                      onTapYes: () {
                                    _regisAction();
                                  });
                                },
                              ),
                            ),
                      SizedBox(height: 10.h),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Sudah punya akun?',
                                  style:
                                      AppTextStyle.poppinsReg(fontSize: 12.sp)),
                              TextSpan(
                                  text: ' Login',
                                  style:
                                      AppTextStyle.poppinsBold(fontSize: 12.sp),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.router.replace(LoginPageRoute());
                                    })
                            ],
                          ),
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
