import 'package:d_1/src/domain/responses/project.dart';
import 'package:d_1/src/pages/guardar_page.dart';
import 'package:d_1/src/pages/home_page.dart';
import 'package:d_1/src/widgets/icon_container.dart';
import 'package:d_1/src/widgets/tabla_from.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:data_table_2/data_table_2.dart';

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
            Color.fromARGB(255, 161, 52, 52),
            Color.fromARGB(0, 241, 150, 150)
          ], begin: Alignment.bottomCenter)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
                  Text("Reporte de Tareas",
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  Divider(height: 50),
                  TablaFrom(),
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
