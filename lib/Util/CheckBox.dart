import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBox extends StatefulWidget {
  CheckBox({super.key, required this.check, required this.onChanged});
  final bool check;
  void Function(bool?)? onChanged;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.check,
      onChanged: (bool? value) {
        widget.onChanged;
      },
    );
  }
}
