import 'package:azaproject/MainScreen/Acceuil/Branding3.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/LogIn.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class BRanding2 extends StatefulWidget {
  const BRanding2({super.key});

  @override
  State<BRanding2> createState() => _BRanding2State();
}

class _BRanding2State extends State<BRanding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Text(
                      'Choisissez des emplacements sur',
                      style: Fonts.boldSecondary,
                    ),
                    Text(
                      'une carte interactive.',
                      style: Fonts.boldSecondary,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                        'lib/images/social-mobile-app-with-gps-navigator-on-phone.gif'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Consultez la météo pour être préparé.',
                        style: Fonts.boldSecondary,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    },
                    child: const Text('Skip'),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.2),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BRanding3()));
                      },
                      child: const Text('Suivant'))
                ],
              )
            ],
          ),
        ));
  }
}
