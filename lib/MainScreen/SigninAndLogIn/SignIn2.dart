import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn3.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class SignIn_2 extends StatefulWidget {
  const SignIn_2({super.key});

  @override
  State<SignIn_2> createState() => _SignIn_2State();
}

class _SignIn_2State extends State<SignIn_2> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nom_d_utilisateur_controlleur =
        TextEditingController();
    TextEditingController MotDePasseControlleur = TextEditingController();
    TextEditingController ConfMotDePasseControlleur = TextEditingController();
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
                    text: 'Nom d\' utilisateur',
                    controller: nom_d_utilisateur_controlleur,
                    PasswordChar: false,
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
                    text: 'Mot de passe',
                    controller: MotDePasseControlleur,
                    PasswordChar: false,
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
                    text: 'Confirmer Mot de passe',
                    controller: ConfMotDePasseControlleur,
                    PasswordChar: false,
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
                            if (nom_d_utilisateur_controlleur.text.isNotEmpty &&
                                MotDePasseControlleur.text.isNotEmpty &&
                                ConfMotDePasseControlleur.text ==
                                    MotDePasseControlleur.text) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn_3()));
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
      ),
    );
  }
}
