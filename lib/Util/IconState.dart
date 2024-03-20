// ignore_for_file: must_be_immutable

import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData iconFalse;
  final IconData icontrue;
  Function()? Onchanged;
  final bool value;
  MyIcon(
      {super.key,
      required this.iconFalse,
      required this.icontrue,
      required this.Onchanged,
      required this.value});
  final MyColors couleur = new MyColors();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onchanged,
      child: Icon(
        value ? icontrue : iconFalse,
        size: 24,
        color: value ? couleur.TertiaryColors : couleur.SecondaryColors,
      ),
    );
  }
}
