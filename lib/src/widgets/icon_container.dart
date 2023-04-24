import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String url;
  const IconContainer({required this.url}) : assert(url != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 10.0,
      child: CircleAvatar(
        radius: 10.0,
        backgroundColor: Colors.black12,
        backgroundImage: AssetImage(this.url),
      ),
    );
  }
}
