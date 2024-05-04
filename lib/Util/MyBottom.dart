import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  final MyColors couleur = MyColors();
  final TextStyle? textStyle;
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  MyBottom(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textStyle,
      this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: onPressed,
      color: color == null ? couleur.SecondaryColors : color,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
