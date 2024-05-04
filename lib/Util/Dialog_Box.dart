import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class BoiteDialogue extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final VoidCallback? onModify;
  final List? task;
  final int? index;

  const BoiteDialogue({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.task = null,
    this.index,
    this.onModify,
  });
  static TextEditingController contenu = TextEditingController();
  @override
  State<BoiteDialogue> createState() => BoiteDialogueState();
}

class BoiteDialogueState extends State<BoiteDialogue> {
  MyColors couleur = MyColors();
  DateTime? selectedDateStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.task != null && widget.task!.isNotEmpty) {
      BoiteDialogue.contenu =
          TextEditingController(text: widget.task![widget.index!][0]);
    } else {}
  }

  Future<DateTime?> dateTimePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateStart ?? DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime.now().add(const Duration(days: 1000)),
      cancelText: 'Annuler',
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        cancelText: 'Annuler',
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }

    return null;
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: //Titre
          Text('Créer', style: Fonts.boldSecondaryMid),
      backgroundColor: couleur.TertiaryColors,
      content: Container(
        height: 200,
        padding: const EdgeInsets.only(top: 50, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //textbox
            MyTextField(
              Radius: 20,
              text: 'Créer une nouvelle tâche',
              style: Fonts.regularHint,
              fillcolor: Colors.transparent,
              controller: widget.task == null
                  ? widget.controller
                  : BoiteDialogue.contenu,
              PasswordChar: false,
            ),
            //boutton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Boutton de rappel
                    MyBottom(
                        text: 'Définir un rappel',
                        onPressed: () async {
                          MyPages.rappelDate = await dateTimePicker();
                        })
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //bouton de sauvegarde
                    MyBottom(
                        textStyle: Fonts.regularBlack,
                        text: widget.task != null && widget.task!.isNotEmpty
                            ? 'Modifier'
                            : 'Sauvegarder',
                        onPressed: widget.onSave),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
