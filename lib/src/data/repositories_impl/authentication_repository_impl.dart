import 'package:d_1/src/data/data_source/remote/authentication_api.dart';
import 'package:d_1/src/domain/models/repositories/authentication_repository.dart';
import 'dart:async';
import 'package:d_1/src/domain/responses/login_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _api;

  AuthenticationRepositoryImpl(this._api);
  @override
  Future<String?> get accessToken async {
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return _api.login(email, password);
  }
}
