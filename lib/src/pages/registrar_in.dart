import 'package:d_1/src/pages/ingresar_in.dart';
import 'package:d_1/src/widgets/logout_form.dart';
import 'package:flutter/material.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
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
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("imagen/descarga.png"),
                  Text(
                    "COOP Fernando Daquilema",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "Soporte y Mantenimiento",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    "Registro",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Divider(
                    height: 10.0,
                  ),
                  LogoutForm(),
                  Divider(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 151, 5, 5)),
                        onPressed: () {
                          final Route = MaterialPageRoute(
                              builder: (context) => Ingresarr());
                          Navigator.pushNamed(context, "ingresar_in");
                        },
                        child: Icon(Icons.settings_backup_restore),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
