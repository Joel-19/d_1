import 'package:d_1/src/pages/welcome_page.dart';
import 'package:d_1/src/pages/registrar_in.dart';
import 'package:d_1/src/widgets/input_text.dart';
import 'package:flutter/material.dart';

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
      Navigator.pushNamed(context, "welcome_page");
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
                      primary: Color.fromARGB(255, 218, 143, 143)),
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
