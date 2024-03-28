<<<<<<< HEAD
import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn2.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
=======
>>>>>>> 46e500b51853427acc9393b59bfdf759e6dc733a
import 'package:flutter/material.dart';

class SignIn_1 extends StatefulWidget {
  const SignIn_1({super.key});

  @override
  State<SignIn_1> createState() => _SignIn_1State();
}

class _SignIn_1State extends State<SignIn_1> {
<<<<<<< HEAD
  TextEditingController nomControlleur = new TextEditingController();
  TextEditingController prenomControlleur = new TextEditingController();
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
              style: TextStyle(
                  color: couleur.SecondaryColors,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
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
                    fillcolor: Colors.transparent,
                    Radius: 5,
                    text: 'Nom ',
                    controller: nomControlleur,
                    PasswordChar: false,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                  child: Form(
                      child: MyTextField(
                    fillcolor: Colors.transparent,
                    Radius: 5,
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
                            style: TextStyle(
                                color: couleur.Text,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Bouton radio pour "Homme"
                RadioListTile(
                  title: Text(
                    'Homme',
                    style: TextStyle(fontSize: 22),
                  ),
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
                  title: Text(
                    'Femme',
                    style: TextStyle(fontSize: 22),
                  ),
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
                  title: Text(
                    'Autre',
                    style: TextStyle(fontSize: 22),
                  ),
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
                  child: Container(
                      width: 360,
                      height: 50,
                      child: MyBottom(
                        text: 'Contunier',
                        OnPressed: () {
                          print(_selectedGender);
                          if (nomControlleur.text.isNotEmpty &&
                              prenomControlleur.text.isNotEmpty &&
                              _selectedGender != '') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn_2()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Champ non rempli'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        textStyle: TextStyle(
                            color: couleur.primarycolors, fontSize: 26),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
=======
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
>>>>>>> 46e500b51853427acc9393b59bfdf759e6dc733a
  }
}
