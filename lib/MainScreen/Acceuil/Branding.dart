import 'package:azaproject/MainScreen/Acceuil/Branding1.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/LogIn.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class BrandingPage extends StatefulWidget {
  const BrandingPage({super.key});

  @override
  State<BrandingPage> createState() => _BrandingPageState();
}

class _BrandingPageState extends State<BrandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.3,
                        'lib/images/Logo TaskDo.png'),
                    Text(
                      'Bienvenue dans TaskDo\nVotre Compagnon Polyvalent\npour la Gestion de Tâches\n et d\'Événements !',
                      style: Fonts.boldSecondary,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(),
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
                                builder: (context) => const BRanding1()));
                      },
                      child: const Text('Suivant'))
                ],
              )
            ],
          ),
        ));
  }
}
