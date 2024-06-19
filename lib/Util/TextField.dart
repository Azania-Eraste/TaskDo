import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final double Radius;
  final String text;
  final Function()? onTap;
  final IconData? suffixicon;
  final IconData? prefixIcon;
  final double? suffixIconsize;
  final double? prefixIconsize;
  final TextEditingController? controller;
  final Color? fillcolor;
  final double? Width;
  final bool PasswordChar;
  final InputBorder? border;
  final int? maxlines;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final TextStyle? HintStyle;

  final void Function(String)? onChanged;
  MyTextField({
    super.key,
    required this.Radius,
    required this.text,
    this.suffixicon,
    this.suffixIconsize,
    this.controller,
    this.fillcolor,
    this.Width,
    required this.PasswordChar,
    this.border,
    this.onChanged,
    this.maxlines = 1,
    this.style,
    this.HintStyle,
    this.keyboardType,
    this.prefixIcon,
    this.prefixIconsize,
    this.onTap,
  });
  final MyColors couleur = MyColors();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        onTap: onTap,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLines: maxlines,
        obscureText: PasswordChar,
        controller: controller,
        style: style,
        decoration: InputDecoration(
          border: border,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          hintText: text,
          hintStyle: HintStyle,
          suffixIcon: Icon(
            suffixicon,
            size: suffixIconsize,
            color: couleur.SecondaryColors,
          ),
          prefixIcon: prefixIcon == null
              ? null
              : Icon(
                  prefixIcon,
                  size: prefixIconsize,
                  color: couleur.SecondaryColors,
                ),
          fillColor: fillcolor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Radius),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 06, 79, 96)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Radius),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 06, 79, 96)),
          ),
        ),
      ),
    );
  }
}
