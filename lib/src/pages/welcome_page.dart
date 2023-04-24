import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                  Text("Bienvenido",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Divider(
                    height: 10.0,
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
