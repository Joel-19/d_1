import 'package:d_1/src/domain/responses/login_response.dart';
import 'package:d_1/src/pages/welcome_page.dart';
import 'package:d_1/src/pages/registrar_in.dart';
import 'package:d_1/src/utilidades/dialogs.dart';
import 'package:d_1/src/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:d_1/src/data/helpers/http.dart';
import 'package:d_1/src/data/data_source/helpers/repositories_impl/authentication_repository_impl.dart';
import 'package:d_1/src/data/data_source/remote/authentication_api.dart';
import 'package:d_1/src/domain/models/repositories/authentication_repository.dart';

class LoginForm extends StatefulWidget {
  LoginForm({key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  late String _email;
  late String _password;
  _submit() {
    final isLogin = _formkey.currentState?.validate();
    print("IsLogin Form$isLogin");
    if (isLogin!) {
      //Navigator.pushNamed(context, "welcome_page");
      final http = Http(baseUrl: "https://reqres.in");

      final AuthenticationRepository aut = AuthenticationRepositoryImpl(
        AuthenticationAPI(http),
      );
      //aut.login("eve.holt@reqres.in", "cityslicka").then((value) {
      aut.login(_email, _password).then((value) {
        print(value);
        print("valor");
        if (value == LoginResponse.ok) {
          Navigator.pushNamed(context, "welcome_page",
              arguments: LoginResponse.ok);
        } else {
          Dialogs.alert(context, title: "Error", description: value.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            InputText(
              hint: "Email Address",
              label: "Email Addrees",
              keyboard: TextInputType.emailAddress,
              icono: Icon(Icons.verified_user),
              onChanged: (data) {
                _email = data;
              },
              validator: (data) {
                if (!(data!.contains("@"))) {
                  return "Usuario Invalido";
                }
                return null;
              },
              obsecure: false,
            ),
            Divider(
              height: 10.0,
            ),
            InputText(
              hint: "Contraseña",
              label: "Contraseña",
              obsecure: true,
              icono: Icon(Icons.lock_outline),
              onChanged: (data) {
                _password = data;
              },
              validator: (data) {
                if (data?.trim().length == 0) {
                  return "Contraseña Invalida";
                }
                return null;
              },
              keyboard: TextInputType.multiline,
            ),
            Divider(
              height: 15.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 161, 18, 7)),
                onPressed: (this._submit),
                child: Text(
                  "Ingresar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Solo Personal Autorizado",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 231, 142, 142)),
                  onPressed: () {
                    final Route =
                        MaterialPageRoute(builder: (context) => Registrar());
                    Navigator.pushNamed(context, "registrar_in");
                  },
                  child: Text(
                    "Registar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
