import 'package:azaproject/MainScreen/ForgotPassword/NumberAuthentification.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/SignIn1.dart';
import 'package:azaproject/Service/User.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController nomControlleur = TextEditingController();
  TextEditingController passwordControlleur = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bon retour parmis nous', style: Fonts.boldSecondaryMid),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 75.0, left: 14, right: 14),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Form(
                    child: MyTextField(
                  fillcolor: Colors.transparent,
                  Radius: 5,
                  text: 'Nom d\'utilisateur',
                  HintStyle: Fonts.regularHint,
                  style: Fonts.boldBlack,
                  controller: nomControlleur,
                  PasswordChar: false,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Form(
                    child: MyTextField(
                  fillcolor: Colors.transparent,
                  Radius: 5,
                  text: 'Mot de passe',
                  HintStyle: Fonts.regularHint,
                  style: Fonts.boldBlack,
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
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Number()));
                      },
                      child: Text(
                        'Mot de passe oublié ?',
                        style: Fonts.regularBlack,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    width: 350,
                    height: 60,
                    child: MyBottom(
                      child: Text(
                        'Se connecter',
                        style: Fonts.boldPrimaryMid,
                      ),
                      onPressed: () {
                        if (nomControlleur.text.isNotEmpty &&
                            passwordControlleur.text.isNotEmpty) {
                          setState(() {
                            User.name = nomControlleur.text;
                            User.password = passwordControlleur.text;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyPages()));
                        }
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      thickness: 2,
                      endIndent: 5,
                      indent: 5,
                      color: couleur.SecondaryColors,
                    ),
                    Text(
                      ' Ou continuer avec ',
                      style: Fonts.regularBlackMId,
                    ),
                    Divider(
                      thickness: 2,
                      endIndent: 5,
                      indent: 5,
                      color: couleur.SecondaryColors,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                      child: Center(
                          child: SvgPicture.asset(
                              'lib/images/facebook (2) 1.svg')),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: couleur.SecondaryColors, width: 3)),
                      child: Center(
                          child: SvgPicture.asset(
                        'lib/images/apple.svg',
                        height: 40,
                      )),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: couleur.SecondaryColors, width: 3)),
                      child: Center(
                          child: SvgPicture.asset(
                        'lib/images/google.svg',
                        height: 40,
                      )),
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
                        Text(
                          'vous n\'avez pas de compte ?',
                          style: Fonts.regularBlackSmall,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn_1()));
                          },
                          child: Text(
                            'créez en un',
                            style: Fonts.regularSecondarySmall,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    MyBottom(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPages()));
                      },
                      child: const Text('Skip'),
                    ),
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
