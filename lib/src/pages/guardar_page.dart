import 'package:d_1/src/pages/welcome_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:d_1/src/pages/home_page.dart';
import 'package:d_1/src/widgets/icon_container.dart';
import 'package:d_1/src/widgets/tabla_from.dart';

class GuardarTarea extends StatefulWidget {
  const GuardarTarea({super.key});

  @override
  State<GuardarTarea> createState() => _GuardarTareaState();
}

class _GuardarTareaState extends State<GuardarTarea> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(255, 117, 6, 6),
            Color.fromARGB(0, 218, 91, 91)
          ], begin: Alignment.bottomCenter)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconContainer(url: "imagen/s4.jpg"),
                  Text(
                    "COOP Fernando Daquilema",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    "Soporte y Mantenimiento",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text("Guardar Tarea",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Divider(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 207, 20, 20)),
                    onPressed: () {
                      final Route =
                          MaterialPageRoute(builder: (context) => Welcome());
                      Navigator.pushNamed(context, "welcome_page");
                    },
                    child: Text(
                      "Crear Nueva Tarea",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 207, 20, 20)),
                    onPressed: () {
                      final Route =
                          MaterialPageRoute(builder: (context) => HomePage());
                      Navigator.pushNamed(context, "home");
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
