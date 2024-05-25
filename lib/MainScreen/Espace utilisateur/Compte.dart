import 'package:azaproject/Service/User.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/TextFormField.dart';
import 'package:flutter/material.dart';

class EspaceCompte extends StatefulWidget {
  const EspaceCompte({super.key});

  @override
  State<EspaceCompte> createState() => _EspaceCompteState();
}

class _EspaceCompteState extends State<EspaceCompte> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomUserController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomController.text = User.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            color: const Color.fromARGB(255, 06, 79, 96),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          backgroundColor: couleur.Screen,
          title: Text(
            'Compte',
            style: Fonts.boldSecondary,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MytextFormField(
                    HintText: 'Nom',
                    radius: 10,
                    controller: nomController,
                    hintStyle: Fonts.regularHint,
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MytextFormField(
                    HintText: 'Prenom',
                    controller: prenomController,
                    radius: 10,
                    hintStyle: Fonts.regularHint,
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MytextFormField(
                    HintText: 'Nom d\'utilisateur',
                    controller: nomUserController,
                    radius: 10,
                    hintStyle: Fonts.regularHint,
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MytextFormField(
                    HintText: 'Email',
                    controller: emailController,
                    radius: 10,
                    hintStyle: Fonts.regularHint,
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: couleur.SecondaryColors,
          child: Icon(
            Icons.save_alt,
            color: couleur.TertiaryColors,
          ),
        ));
  }
}
