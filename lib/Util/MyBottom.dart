import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  final MyColors couleur = MyColors();
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;
  MyBottom(
      {super.key,
      required this.onPressed,
      this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: onPressed,
      color: color ?? couleur.SecondaryColors,
      child: child,
    );
  }
}
