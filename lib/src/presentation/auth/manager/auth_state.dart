part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  // final UserModel? userData;
  // final String? message;
  //
  // const AuthState({this.userData, this.message});
  //
  // @override
  // List<Object> get props => [userData, message];
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final UserModel? response;
  final String message;

  AuthSuccess({this.response, required this.message});

  @override
  List<Object> get props => [message];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}
