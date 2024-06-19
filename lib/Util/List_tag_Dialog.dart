
import 'package:azaproject/MainScreen/Tasks/TaskScreen.dart';
import 'package:flutter/material.dart';

class DialogTag extends StatelessWidget {
  const DialogTag({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            content: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text("${TaskScreen.option[index]}"),
              );
            }),
          );
  }
}