import 'package:d_1/src/domain/responses/login_response.dart';

abstract class AuthenticationRepository {
  Future<String?> get accessToken;
  Future<LoginResponse> login(String email, String password);
}
