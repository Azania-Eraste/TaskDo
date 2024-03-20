import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: DatePickerDialog(
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 1000)),
      ),
    );
  }
}
