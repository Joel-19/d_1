import 'package:d_1/src/domain/responses/login_response.dart';
import 'package:d_1/src/domain/responses/project.dart';

abstract class UserRepository {
  Future<List<Project>> getProjects(String token);
}
