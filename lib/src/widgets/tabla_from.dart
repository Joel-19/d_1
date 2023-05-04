import 'dart:ffi';

import 'package:d_1/src/domain/responses/project.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:d_1/src/pages/registrar_in.dart';
import 'package:d_1/src/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:d_1/src/data/data_source/helpers/repositories_impl/user_repository_impl.dart';
import 'package:d_1/src/data/data_source/remote/authentication_user_api.dart';
import 'package:d_1/src/domain/models/repositories/user_repository.dart';
import 'package:d_1/src/data/helpers/http.dart';
import 'package:data_table_2/data_table_2.dart';

class TablaFrom extends StatefulWidget {
  const TablaFrom({super.key});
  @override
  State<TablaFrom> createState() => _TablaFromState();
}

class _TablaFromState extends State<TablaFrom> {
  GlobalKey<FormState> _formkey = GlobalKey();
  List<Project> listaProyectos = [];

  String _name = "";
  _submit() {
    final isLogin = _formkey.currentState?.validate();
    print("IsLogin Form$isLogin");
    if (isLogin!) {
      Navigator.pushNamed(context, "guardar_page");
    }
  }

  _cargarProyectos() async {
    final http = Http(baseUrl: "https://redminedev.coopdaquilema.com");
    final UserRepository userRepo = UserRepositoryImpl(
      UserAPI(http),
    );
    listaProyectos =
        await userRepo.getProjects("d3a5f15d7abd57783dc2d74b24bfae4569eaff51");
    print("tamanio desde tabla_form:${listaProyectos.length}");
    setState(() {});
  }

  _generateDataRow(List<Project> listaProyectos) {
    List<DataRow> lista = [];
    for (var proyecto in listaProyectos) {
      List<DataCell> celdas = [
        DataCell(Text('${proyecto.id}')),
        DataCell(Text('${proyecto.identifier}')),
        DataCell(Text('${proyecto.name}')),
        DataCell(Text('${proyecto.status}')),
        DataCell(Text('${proyecto.isPublic}')),
        DataCell(Text('${proyecto.inheritMembers}')),
        DataCell(Text('${proyecto.createdOn}')),
        DataCell(Text('${proyecto.updatedOn}'))
      ];
      lista.add(DataRow(cells: celdas));
    }
    return lista;
  }

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarProyectos();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            for (var i = 0; i < listaProyectos.length; i++)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 37, 35, 35),
                      width: 2.0,
                      style: BorderStyle.solid),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Id:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].id}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Identificador:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].identifier}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Nombre:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].name}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Estado:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].status}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Publico:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].isPublic}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Heredado:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].inheritMembers}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Creado:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].createdOn}')
                        ],
                      ),
                      Row(
                        children: [
                          Text("Actulizado:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('${listaProyectos[i].updatedOn}')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            Divider(
              height: 150,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 161, 18, 7)),
                onPressed: this._submit,
                child: Text(
                  "Guardar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
