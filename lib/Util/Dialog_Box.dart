import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class BoiteDialogue extends StatelessWidget {
  final controller;
  final VoidCallback OnSave;
  final VoidCallback OnCancel;
  BoiteDialogue(
      {super.key,
      required this.controller,
      required this.OnSave,
      required this.OnCancel});
  final MyColors couleur = MyColors();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: //Titre
          Text(
        'Créer',
        style: TextStyle(
            color: couleur.SecondaryColors,
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
      backgroundColor: couleur.TertiaryColors,
      content: Container(
        height: 200,
        width: 300,
        padding: EdgeInsets.only(top: 50, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //textbox
            MyTextField(
              Radius: 20,
              text: 'Créer une nouvelle tâche',
              fillcolor: Colors.transparent,
              controller: controller,
              PasswordChar: false,
            ),
            //boutton
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //bouton de sauvegarde
                MyBottom(text: 'Sauvegarder', OnPressed: OnSave),
                SizedBox(
                  width: 10,
                ),
                //bouton d'annulation
                MyBottom(text: 'Annuler', OnPressed: OnCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
