import 'package:azaproject/Util/CalendarState.dart';
import 'package:flutter/material.dart';

class SignIn_3 extends StatefulWidget {
  const SignIn_3({super.key});

  @override
  State<SignIn_3> createState() => _SignIn_3State();
}

class _SignIn_3State extends State<SignIn_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Créer un compte',
              style: TextStyle(
                  color: couleur.SecondaryColors,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ));
  }
}
