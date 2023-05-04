import 'package:d_1/src/pages/ingresar_in.dart';
import 'package:d_1/src/widgets/icon_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(255, 128, 5, 5),
            Color.fromRGBO(231, 200, 200, 1),
          ], begin: Alignment.topRight)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 200),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconContainer(url: "imagen/una.png"),
                  Text(
                    "COOP Fernando Daquilema",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "Soporte y Mantenimiento",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Divider(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 161, 18, 7)),
                      onPressed: () {
                        final Route = MaterialPageRoute(
                            builder: (context) => Ingresarr());
                        Navigator.pushNamed(context, "ingresar_in");
                      },
                      child: Text(
                        "Ingresar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 161, 18, 7)),
                      onPressed: () {
                        final Route = MaterialPageRoute(
                            builder: (context) => Ingresarr());
                        Navigator.pushNamed(context, "registrar_in");
                      },
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
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
  }
}
