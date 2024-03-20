import 'package:azaproject/MainScreen/Notes/NotesAdd.dart';
import 'package:azaproject/MainScreen/Pages.dart';
// ignore: unused_import
import 'package:azaproject/MainScreen/SigninAndLogIn/LogIn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/NotesAdd': (context) => NotesAdd(),
        '/Page': (context) => MyPages(),
      },
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
