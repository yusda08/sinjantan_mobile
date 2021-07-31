import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});

  String toString() {
    if (message == null) return "ServerException Occurs";
    return "$message";
  }
}

class ConnectionFailure extends Failure {}

class AuthFailure extends Failure {
  final String message;

  AuthFailure(this.message);
}

class PlatformFailure extends Failure {}

class CacheFailure extends Failure {}

class LocationFailure extends Failure {}
