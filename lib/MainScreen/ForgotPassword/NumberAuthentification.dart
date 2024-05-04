import 'package:azaproject/MainScreen/ForgotPassword/CodeVerification.dart';
import 'package:azaproject/MainScreen/ForgotPassword/EmailAuthentification.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextFormField.dart';
import 'package:flutter/material.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  TextEditingController numero = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleur.Screen,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Recherche du compte',
            style: Fonts.boldSecondaryMid,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MytextFormField(
                  hintStyle: Fonts.regularHint,
                  controller: numero,
                  inputType: TextInputType.number,
                  HintText: 'numero',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Email())));
                      },
                      child: Text(
                        'Rechercher avec un Email ?',
                        style: Fonts.regularBlack,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                    width: 360,
                    height: 60,
                    child: MyBottom(
                      text: 'Continuer',
                      onPressed: () {
                        if (numero.text.isNotEmpty) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const CodeVerification())));
                        }
                      },
                      textStyle: Fonts.boldPrimaryMid,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
