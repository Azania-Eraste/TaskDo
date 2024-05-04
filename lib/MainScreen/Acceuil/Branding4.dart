import 'package:azaproject/MainScreen/Acceuil/Branding5.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/LogIn.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class Branding4 extends StatefulWidget {
  const Branding4({super.key});

  @override
  State<Branding4> createState() => _Branding4State();
}

class _Branding4State extends State<Branding4> {
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
              Text(
                'Travail collaboratif',
                style: Fonts.boldSecondary,
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
                        'lib/images/social-business-men-shaking-hands-for-deal.gif'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            'Des fonctionnalités avancées conçues',
                            style: Fonts.boldSecondary,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'pour maximiser votre productivité',
                                  style: Fonts.boldSecondary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' de groupe.',
                                    style: Fonts.boldSecondary,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
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
                                builder: (context) => const Branding5()));
                      },
                      child: const Text('Suivant'))
                ],
              )
            ],
          ),
        ));
  }
}
