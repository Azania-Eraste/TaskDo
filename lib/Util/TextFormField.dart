import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class MytextFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String? HintText;
  final TextInputType? inputType;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxlenght;
  final double radius;
  const MytextFormField(
      {super.key,
      this.controller,
      this.inputType,
      this.validator,
      this.style,
      this.textAlign = TextAlign.start,
      this.maxlenght,
      this.HintText,
      this.hintStyle,
      this.radius = 5});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxlenght,
      textAlign: textAlign,
      style: Fonts.boldBlack,
      controller: controller,
      decoration: InputDecoration(
          hintText: HintText,
          hintStyle: hintStyle,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: couleur.TertiaryColors),
              borderRadius: BorderRadius.circular(radius))),
      keyboardType: inputType,
      validator: validator,
    );
  }
}
