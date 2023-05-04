import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String url;
  const IconContainer({required this.url}) : assert(url != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: CircleAvatar(
        radius: 80.0,
        backgroundColor: Color.fromARGB(31, 233, 172, 172),
        backgroundImage: AssetImage(this.url),
      ),
    );
  }
}
