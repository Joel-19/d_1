import 'dart:async';
import 'dart:io';
import 'package:d_1/src/data/helpers/http.dart';
import 'package:d_1/src/data/data_source/helpers/http_method.dart';
import 'package:d_1/src/domain/responses/login_response.dart';

class AuthenticationAPI {
  final Http _http;
  AuthenticationAPI(this._http);
  Future<LoginResponse> login(String email, String password) async {
    final result = await _http.request(
      "/api/login",
      method: HttpMethod.post,
      body: {"email": email, "password": password},
    );
    print("resultado ${result}");
    print("resultado data ${result.data}");
    print("resultado data runtimeType ${result.data.runtimeType}");
    print("datos de errores: ${result.error?.data}");
    print("resultado statusCode ${result.statusCode}");

    if (result.error == null) {
      return LoginResponse.ok;
    }
    if (result.statusCode == 400) {
      return LoginResponse.accessDenied;
    }
    final error = result.error!.exception;
    if (error is SocketException || error is TimeoutException) {
      return LoginResponse.networkError;
    }

    return LoginResponse.unknownError;
  }
}
