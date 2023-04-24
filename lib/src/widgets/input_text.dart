import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final Icon icono;
  final TextInputType keyboard;
  final bool obsecure;
  final void Function(String data) onChanged;
  final String? Function(String? data) validator;
  const InputText(
      {key,
      required this.label,
      required this.hint,
      required this.icono,
      required this.keyboard,
      required this.obsecure,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: this.keyboard,
        obscureText: this.obsecure,
        onChanged: this.onChanged,
        validator: this.validator,
        decoration: InputDecoration(
            hintText: this.hint,
            labelText: this.label,
            labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
            suffixIcon: this.icono,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
