// ignore_for_file: must_be_immutable

import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData iconFalse;
  final IconData icontrue;
  Function()? onchanged;
  final bool value;
  final bool isDone;
  MyIcon(
      {super.key,
      required this.iconFalse,
      required this.icontrue,
      required this.onchanged,
      required this.value,
      required this.isDone});
  final MyColors couleur = MyColors();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onchanged,
      child: Icon(
        value ? icontrue : iconFalse,
        size: 24,
        color: isDone
            ? couleur.HintText
            : value
                ? couleur.TertiaryColors
                : couleur.SecondaryColors,
      ),
    );
  }
}
