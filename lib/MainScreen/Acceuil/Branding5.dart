import 'package:azaproject/MainScreen/SigninAndLogIn/LogIn.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class Branding5 extends StatefulWidget {
  const Branding5({super.key});

  @override
  State<Branding5> createState() => _Branding5State();
}

class _Branding5State extends State<Branding5> {
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
                'Sauvegarde des données',
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
                        'lib/images/transistor-uploading-files-from-computer-to-cloud-storage.gif'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Sauvegarde des données en internes',
                        style: Fonts.boldSecondary,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.19,
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
                                builder: (context) => const LogInScreen()));
                      },
                      child: const Text('Suivant'))
                ],
              )
            ],
          ),
        ));
  }
}
