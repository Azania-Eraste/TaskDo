import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextFormField.dart';
import 'package:flutter/material.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  TextEditingController code1Controller = TextEditingController();
  TextEditingController code2Controller = TextEditingController();
  TextEditingController code3Controller = TextEditingController();
  TextEditingController code4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Verification du compte',
              style: Fonts.boldSecondaryMid,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 50,
                        child: MytextFormField(
                          maxlenght: 1,
                          controller: code1Controller,
                          inputType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                        width: 50,
                        child: MytextFormField(
                          maxlenght: 1,
                          controller: code2Controller,
                          inputType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                        width: 50,
                        child: MytextFormField(
                          maxlenght: 1,
                          controller: code3Controller,
                          inputType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                        width: 50,
                        child: MytextFormField(
                          maxlenght: 1,
                          controller: code4Controller,
                          inputType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                  width: 360,
                  height: 60,
                  child: MyBottom(
                    text: 'Terminer',
                    onPressed: () {
                      if (code1Controller.text.isNotEmpty &&
                          code2Controller.text.isNotEmpty &&
                          code3Controller.text.isNotEmpty &&
                          code4Controller.text.isNotEmpty) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const MyPages())));
                      }
                    },
                    textStyle: Fonts.boldPrimaryMid,
                  )),
            )
          ]),
        )));
  }
}
