import 'package:azaproject/MainScreen/Acceuil/Branding.dart';
import 'package:azaproject/MainScreen/Espace%20utilisateur/Compte.dart';
import 'package:azaproject/MainScreen/ForgotPassword/CodeVerification.dart';
import 'package:azaproject/MainScreen/ForgotPassword/EmailAuthentification.dart';
import 'package:azaproject/MainScreen/ForgotPassword/NumberAuthentification.dart';

import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn1.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn2.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn3.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  //Initialisation de la base de donnée interne Hive
  await Hive.initFlutter();

  //Ouverture ou creation de la base de donnée interne
  var box = await Hive.openBox('TaskDo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return MaterialApp(
        routes: {
          '/Page': (context) => const MyPages(),
          '/Email': (context) => const Email(),
          '/Number': (context) => const Number(),
          '/Code': (context) => const CodeVerification(),
          '/SignIn1': (context) => const SignIn_1(),
          '/SignIn2': (context) => const SignIn_2(),
          '/SignIn3': (context) => const SignIn_3(),
          '/profile': (context) => const EspaceCompte(),
        },
        debugShowCheckedModeBanner: false,
        home: const BrandingPage(),
      );
    }));
  }
}
