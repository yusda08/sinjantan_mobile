import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/error/exception_mapper.dart';
import 'package:sijantan/src/data/models/user/user_model.dart';
import 'package:sijantan/src/domain/use_cases/user/login.dart';
import 'package:sijantan/src/domain/use_cases/user/register.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final UserLogin _login;
  final UserRegister _register;

  // final FCMHelper _fcmHelper;

  AuthCubit({
    required UserLogin login,
    required UserRegister register,
    // @required FCMHelper fcmHelper,
  })  : _login = login,
        _register = register,
        // _fcmHelper = fcmHelper,
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
      (registerResp) {

        emit(AuthSuccess(message: registerResp.message));
      },
    );
  }

// login(
//     {@required String userPhoneNumber, @required String userPassword}) async {
//   emit(AuthLoading());
//   final login = await _login(LoginFormData(
//       userPhoneNumber: userPhoneNumber, userPassword: userPassword));
//   if (login is DataSuccess) {
//     _fcmHelper.subscribeFCMUserTopic(login.data.userEntity.userId);
//     emit(AuthSuccess(
//         response: login.data.userEntity, message: login.data.message));
//   }
//   if (login is DataFailed) emit(AuthFailure(message: login.error.message));
//   if (login is ResponseError)
//     emit(AuthFailure(message: login.apiErrResp.message));
//   if (login is ConnectionFailed) {
//     emit(AuthFailure(message: login.message));
//   }
// }

}
