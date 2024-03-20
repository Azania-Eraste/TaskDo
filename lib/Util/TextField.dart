import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final double Radius;
  final String text;
  final IconData? icon;
  final double? Iconsize;
  final TextEditingController? controller;
  final Color? fillcolor;
  final double? Width;
  final bool PasswordChar;
  final InputBorder? border;
  MyTextField(
      {super.key,
      required this.Radius,
      required this.text,
      this.icon,
      this.Iconsize,
      this.controller,
      this.fillcolor,
      this.Width,
      required this.PasswordChar,
      this.border});
  final MyColors couleur = MyColors();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        obscureText: PasswordChar,
        controller: controller,
        decoration: InputDecoration(
          border: border,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          hintText: text,
          hintStyle: TextStyle(color: couleur.SecondaryColors),
          suffixIcon: Icon(
            icon,
            size: Iconsize,
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
