import 'dart:convert';
import 'package:d_1/src/pages/welcome_page.dart';
import 'package:d_1/src/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:d_1/src/pages/ingresar_in.dart';
import 'package:d_1/src/widgets/icon_container.dart';

class Ingresarr extends StatefulWidget {
  const Ingresarr({super.key});

  @override
  State<Ingresarr> createState() => _IngresarrState();
}

class _IngresarrState extends State<Ingresarr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(255, 102, 2, 2),
            Color.fromARGB(0, 235, 39, 35)
          ], begin: Alignment.bottomRight)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("imagen/descarga.png"),
                  Text(
                    "COOP Fernando Daquilema",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    "Soporte y Mantenimiento",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text("Login",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Divider(
                    height: 10.0,
                  ),
                  //formulario
                  LoginForm(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
