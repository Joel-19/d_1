// ignore_for_file: unused_local_variable

import 'package:d_1/src/data/helpers/http.dart';
import 'package:d_1/src/data/data_source/helpers/repositories_impl/authentication_repository_impl.dart';
import 'package:d_1/src/data/data_source/remote/authentication_api.dart';
import 'package:d_1/src/domain/models/repositories/authentication_repository.dart';
import 'package:d_1/src/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:d_1/src/pages/home_page.dart';
import 'package:d_1/src/pages/ingresar_in.dart';
import 'package:d_1/src/pages/registrar_in.dart';

void main() {
  runApp(const MyApp());
  runApp(TmpPage1());
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
