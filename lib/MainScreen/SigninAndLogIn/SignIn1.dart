import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn2.dart';
import 'package:azaproject/Service/user.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class SignIn_1 extends StatefulWidget {
  const SignIn_1({super.key});

  @override
  State<SignIn_1> createState() => _SignIn_1State();
}

class _SignIn_1State extends State<SignIn_1> {
  TextEditingController nomControlleur = TextEditingController();
  TextEditingController prenomControlleur = TextEditingController();
  bool radioCheck = false;
  String _selectedGender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleur.Screen,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Créer un compte',
              style: Fonts.boldSecondaryMid,
            ),
          ],
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
                    text: 'Nom ',
                    controller: nomControlleur,
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
                    text: 'Prenom',
                    controller: prenomControlleur,
                    PasswordChar: false,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 17),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sexe',
                            style: Fonts.boldBlackMid,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Bouton radio pour "Homme"
                RadioListTile(
                  title: Text('Homme', style: Fonts.boldBlack),
                  value: 'Homme',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value as String;
                    });
                  },
                ),
                // Bouton radio pour "Femme"
                RadioListTile(
                  title: Text('Femme', style: Fonts.boldBlack),
                  value: 'Femme',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value as String;
                    });
                  },
                ),
                // Bouton radio pour "Autre"
                RadioListTile(
                  title: Text('Autre', style: Fonts.boldBlack),
                  value: 'Autre',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value as String;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                      width: 360,
                      height: 60,
                      child: MyBottom(
                          text: 'Continuer',
                          onPressed: () {
                            if (nomControlleur.text.isNotEmpty &&
                                prenomControlleur.text.isNotEmpty &&
                                _selectedGender != '') {
                              setState(() {
                                User.name = nomControlleur.text;
                                User.surname = prenomControlleur.text;
                                User.gender = _selectedGender;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn_2()));
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
