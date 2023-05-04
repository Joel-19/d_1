import 'package:d_1/src/pages/registrar_in.dart';
import 'package:d_1/src/widgets/input_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class LogoutForm extends StatefulWidget {
  const LogoutForm({super.key});
  @override
  State<LogoutForm> createState() => _LogoutFormState();
}

class _LogoutFormState extends State<LogoutForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _name = "";
  String _email = "";
  String _password = "";
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
              hint: "Usuario",
              label: "Nombre y Apelledido",
              keyboard: TextInputType.multiline,
              obsecure: false,
              icono: Icon(Icons.supervised_user_circle),
              onChanged: (data) {
                _name = data;
              },
              validator: (data) {
                if (data?.trim().length == 0) {
                  return "Nombres Invalidos";
                }
                return null;
              },
            ),
            Divider(
              height: 15.0,
            ),
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
                onPressed: this._submit,
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
              ],
            )
          ],
        ));
  }
}
