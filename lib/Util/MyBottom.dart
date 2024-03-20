import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final VoidCallback OnPressed;
  MyBottom(
      {super.key, required this.text, required this.OnPressed, this.textStyle});
  final MyColors couleur = MyColors();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: OnPressed,
      color: couleur.SecondaryColors,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
