import 'package:d_1/src/data/data_source/helpers/repositories_impl/user_repository_impl.dart';
import 'package:d_1/src/data/data_source/remote/authentication_user_api.dart';
import 'package:d_1/src/data/helpers/http.dart';
import 'package:d_1/src/data/data_source/helpers/repositories_impl/authentication_repository_impl.dart';
import 'package:d_1/src/data/data_source/remote/authentication_api.dart';
import 'package:d_1/src/domain/models/repositories/authentication_repository.dart';
import 'package:d_1/src/domain/models/repositories/user_repository.dart';
import 'package:d_1/src/pages/guardar_page.dart';
import 'package:d_1/src/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:d_1/src/pages/home_page.dart';
import 'package:d_1/src/pages/ingresar_in.dart';
import 'package:d_1/src/pages/registrar_in.dart';

void main() {
  runApp(const MyApp());
  //(TmpPage2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: "home",
      routes: <String, WidgetBuilder>{
        "home": (context) => HomePage(),
        "ingresar_in": (context) => Ingresarr(),
        "registrar_in": (context) => Registrar(),
        "welcome_page": (context) => Welcome(),
        "guardar_page": (context) => GuardarTarea(),
      },
    );
  }
}

class TmpPage1 extends StatefulWidget {
  const TmpPage1({super.key});

  @override
  State<TmpPage1> createState() => _TmpPage1State();
}

class _TmpPage1State extends State<TmpPage1> {
  @override
  void initState() {
    super.initState();

    final http = Http(baseUrl: "https://reqres.in");

    final AuthenticationRepository aut = AuthenticationRepositoryImpl(
      AuthenticationAPI(http),
    );
    aut.login("eve.holt@reqres.in", "cityslicka").then(
          (value) => print(value),
        );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/*class TmpPage2 extends StatefulWidget {
  const TmpPage2({super.key});

  @override
  State<TmpPage2> createState() => _TmpPage2State();
}

class _TmpPage2State extends State<TmpPage2> {
  @override
  void initState() {
    super.initState();

    final http =
        Http(baseUrl: "https://redminedev.coopdaquilema.com/projects.json");

    final UserRepository userRepo = UserRepositoryImpl(
      UserAPI(http),
    );
    userRepo
        .getProjects("d3a5f15d7abd57783dc2d74b24bfae4569eaff51")
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/
