import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/api_client.dart';
import 'package:sijantan/core/api/request/auth/login_request_object.dart';
import 'package:sijantan/core/api/request/auth/register_request_object.dart';
import 'package:sijantan/core/api/response/auth/login_response.dart';
import 'package:sijantan/core/api/response/auth/register_response.dart';

abstract class UserRemoteDataSrc {
  Future<RegisterResponse> register(RegisterRequestObject formData);

  Future<LoginResponse> login(LoginRequestObject formData);
}

@LazySingleton(as: UserRemoteDataSrc)
class UserRemoteDataSrcImpl implements UserRemoteDataSrc {
  final ApiClient _apiClient;

  UserRemoteDataSrcImpl(this._apiClient);

  @override
  Future<RegisterResponse> register(RegisterRequestObject formData) async {
    return await _apiClient.post(
        endpoint: 'auth/register',
        serializer: RegisterResponse.serializer,
        body: formData.getJsonBody()) as RegisterResponse;
  }

  @override
  Future<LoginResponse> login(LoginRequestObject formData) async {
    return await _apiClient.post(
        endpoint: 'auth/login',
        serializer: LoginResponse.serializer,
        body: formData.getJsonBody()) as LoginResponse;
  }
}
