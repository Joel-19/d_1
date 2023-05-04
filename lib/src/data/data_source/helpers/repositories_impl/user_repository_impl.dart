import 'package:d_1/src/data/data_source/remote/authentication_api.dart';
import 'package:d_1/src/data/data_source/remote/authentication_user_api.dart';
import 'package:d_1/src/domain/models/repositories/authentication_repository.dart';
import 'package:d_1/src/domain/models/repositories/user_repository.dart';
import 'package:d_1/src/domain/responses/login_response.dart';
import 'package:d_1/src/domain/responses/project.dart';

class UserRepositoryImpl implements UserRepository {
  final UserAPI _api;

  UserRepositoryImpl(this._api);

  @override
  Future<List<Project>> getProjects(String token) {
    return _api.getProjects(token);
  }
}
