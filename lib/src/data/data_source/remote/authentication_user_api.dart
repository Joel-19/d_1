import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:d_1/src/data/helpers/http.dart';
import 'package:d_1/src/data/data_source/helpers/http_method.dart';
import 'package:d_1/src/domain/responses/project.dart';
import 'package:d_1/src/domain/responses/user_response.dart';

class UserAPI {
  final Http _http;
  UserAPI(this._http);
  Future<List<Project>> getProjects(String token) async {
    List<Project> listaProyectos = [];
    final result = await _http.request(
      "/projects.json",
      method: HttpMethod.get,
      body: {"key": token},
    );

    print("resultado statusCode ${result.statusCode}");

    if (result.statusCode == 200) {
      print(result.data);
      final jsonArrayProjects = result.data["projects"];
      listaProyectos =
          List.from(jsonArrayProjects).map((e) => Project.fromJson(e)).toList();
      print("tamanio proyectos: ${listaProyectos.length}");
    }

    if (result.statusCode == 400) {
      throw Exception(UserResponse.ErrorEmail.name);
    }
    if (result.error != null) {
      final error = result.error!.exception;
      if (error is SocketException || error is TimeoutException) {
        return throw Exception(UserResponse.ErrorConexion.name);
      }
    }

    return listaProyectos;
  }
}
