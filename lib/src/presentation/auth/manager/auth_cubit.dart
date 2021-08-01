import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/error/exception_mapper.dart';
import 'package:sijantan/core/utils/fcm_helper.dart';
import 'package:sijantan/src/data/models/user/user_model.dart';
import 'package:sijantan/src/domain/use_cases/user/login.dart';
import 'package:sijantan/src/domain/use_cases/user/register.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final UserLogin _login;
  final UserRegister _register;
  final FCMHelper _fcmHelper;

  AuthCubit({
    required UserLogin login,
    required UserRegister register,
    required FCMHelper fcmHelper,
  })  : _login = login,
        _register = register,
        _fcmHelper = fcmHelper,
        super(AuthInitial());

  register(RegisterRequestObject formData) async {
    emit(AuthLoading());
    final registerOrFailure = await _register(formData);
    registerOrFailure.fold(
      (err) => emit(AuthFailure(message: ExceptionMapper.call(err))),
      (registerResp) => emit(AuthSuccess(message: registerResp.message)),
    );
  }

  login(LoginRequestObject formData) async {
    emit(AuthLoading());
    final loginOrFailure = await _login(formData);
    loginOrFailure.fold(
      (err) => emit(AuthFailure(message: ExceptionMapper.call(err))),
      (loginResp) {
        _fcmHelper.subscribeFCMUserTopic(loginResp.userData.kdUser);
        emit(AuthSuccess(message: loginResp.message));
      },
    );
  }
}
