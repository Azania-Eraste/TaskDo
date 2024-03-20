import 'package:azaproject/MainScreen/Pages.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn1.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController nomControlleur = new TextEditingController();
  TextEditingController passwordControlleur = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bon retour parmi nous',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: couleur.SecondaryColors,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 14, right: 14),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                child: Form(
                    child: MyTextField(
                  fillcolor: Colors.transparent,
                  Radius: 5,
                  text: 'Nom d\'utilisateur',
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
                  text: 'Mot de passe',
                  controller: passwordControlleur,
                  PasswordChar: true,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(color: couleur.Text1),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                    width: 360,
                    height: 50,
                    child: MyBottom(
                      text: 'Se connecter',
                      OnPressed: () {
                        if (nomControlleur.text.isNotEmpty &&
                            passwordControlleur.text.isNotEmpty) {
                          print('connection');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPages()));
                        }
                      },
                      textStyle:
                          TextStyle(color: couleur.primarycolors, fontSize: 26),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' Ou continuer avec ',
                      style: TextStyle(color: couleur.Text1, fontSize: 15),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: couleur.SecondaryColors, width: 3)),
                      child: Center(child: Text('Facebook')),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: couleur.SecondaryColors, width: 3)),
                      child: Center(child: Text('Apple')),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: couleur.SecondaryColors, width: 3)),
                      child: Center(child: Text('Google')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('vous n\'avez pas de compte ?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn_1()));
                          },
                          child: Text(
                            'créez en un',
                            style: TextStyle(color: couleur.SecondaryColors),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
