import 'package:azaproject/MainScreen/Acceuil/Branding4.dart';
import 'package:azaproject/MainScreen/SigninAndLogIn/LogIn.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class BRanding3 extends StatefulWidget {
  const BRanding3({super.key});

  @override
  State<BRanding3> createState() => _BRanding3State();
}

class _BRanding3State extends State<BRanding3> {
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
                '✅ Gérez vos tâches et\nvos notes avec facilité ',
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
                        'lib/images/bouncy-to-do-in-progress-and-done-columns-of-the-kanban-board.gif'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            'Ajoutez, supprimez, Filtrer vos notes',
                            style: Fonts.boldSecondary,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'et cochez vos tâches terminées.',
                              style: Fonts.boldSecondary,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
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
                                builder: (context) => const Branding4()));
                      },
                      child: const Text('Suivant'))
                ],
              )
            ],
          ),
        ));
  }
}
