import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Service/user.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class SignIn_3 extends StatefulWidget {
  const SignIn_3({super.key});

  @override
  State<SignIn_3> createState() => _SignIn_3State();
}

class _SignIn_3State extends State<SignIn_3> {
  TextEditingController date_de_naissance_Controlleur = TextEditingController();
  TextEditingController EmailControlleur = TextEditingController();
  TextEditingController NumControlleur = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        appBar: AppBar(
          title: Center(
            child: Text('Créer un compte', style: Fonts.boldSecondaryMid),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                    child: Form(
                        child: MyTextField(
                      style: Fonts.boldBlack,
                      fillcolor: Colors.transparent,
                      Radius: 5,
                      HintStyle: Fonts.regularHint,
                      text: 'Date de naissance',
                      controller: date_de_naissance_Controlleur,
                      PasswordChar: false,
                      keyboardType: TextInputType.datetime,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                    child: Form(
                        child: MyTextField(
                      style: Fonts.boldBlack,
                      fillcolor: Colors.transparent,
                      Radius: 5,
                      HintStyle: Fonts.regularHint,
                      text: 'Email',
                      controller: EmailControlleur,
                      PasswordChar: false,
                      keyboardType: TextInputType.emailAddress,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                    child: Form(
                        child: MyTextField(
                      style: Fonts.boldBlack,
                      fillcolor: Colors.transparent,
                      Radius: 5,
                      HintStyle: Fonts.regularHint,
                      text: 'Numéro',
                      controller: NumControlleur,
                      PasswordChar: false,
                      keyboardType: TextInputType.number,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                        width: 360,
                        height: 60,
                        child: MyBottom(
                            text: 'Continuer',
                            onPressed: () {
                              if (date_de_naissance_Controlleur
                                      .text.isNotEmpty &&
                                  EmailControlleur.text.isNotEmpty &&
                                  NumControlleur.text.isNotEmpty) {
                                setState(() {
                                  User.dateNaiss =
                                      date_de_naissance_Controlleur.text;
                                  User.email = EmailControlleur.text;
                                  User.number = NumControlleur.text;
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyPages()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Champ non rempli'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            },
                            textStyle: Fonts.boldPrimaryMid)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
