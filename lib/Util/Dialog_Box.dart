import 'package:azaproject/List/Task.dart';
import 'package:azaproject/MainScreen/Tasks/TaskScreen.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:azaproject/Util/TextFormField.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

class BoiteDialogue extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final VoidCallback? Tag;
  final List? task;
  final int? index;
  final bool itTag;
  final String Label1;
  final String Label2;

  const BoiteDialogue({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.task,
    this.index,
    required this.Label1,
    required this.Label2,
    required this.itTag,
    this.Tag,
  });
  static TextEditingController contenu = TextEditingController();
  @override
  State<BoiteDialogue> createState() => BoiteDialogueState();
}

class BoiteDialogueState extends State<BoiteDialogue> {
  MyColors couleur = MyColors();
  DateTime? selectedDateStart = DateTime.now();
  int tag = 0;
  List optionChoice = Taskdata.TagList;

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
      lastDate: DateTime.now().add(const Duration(days: 10000)),
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

  Future<int?> tagPicker() async {
    final int? pickedTag = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Tag"),
            content: ChipsChoice.single(
              value: tag,
              onChanged: (value) {
                setState(() {
                  tag = value;
                });
                Navigator.pop(context);
              },
              choiceItems: C2Choice.listFrom(
                  source: optionChoice,
                  value: ((index, item) => index),
                  label: ((index, item) => item)),
              choiceActiveStyle: const C2ChoiceStyle(
                  backgroundColor: Color.fromARGB(255, 06, 79, 96),
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderColor: Color.fromARGB(255, 255, 173, 71),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              choiceStyle: const C2ChoiceStyle(
                  backgroundColor: Color.fromARGB(182, 248, 248, 255),
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              wrapped: true,
            ),
          );
        });

    return tag;
  }

  @override
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
            MytextFormField(
              radius: 20,
              HintText: 'Créer',
              style: Fonts.regularHint,
              controller: widget.task == null
                  ? widget.controller
                  : BoiteDialogue.contenu,
              validator: (p0) {
                if (Taskdata.DoubleTag(p0) == true) {
                  return 'Tag en double';
                }
              },
            ),
            //boutton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    widget.itTag
                        ? MyBottom(
                            child: Text('${widget.Label2}'),
                            onPressed: widget.onCancel)
                        :
                        //Boutton de rappel
                        MyBottom(
                            child: Icon(Icons.alarm),
                            onPressed: () async {
                              MyPages.rappelDate = await dateTimePicker();
                            })
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    //bouton de sauvegarde
                    MyBottom(
                        child: Text(
                          '${widget.Label1}',
                          style: Fonts.regularBlack,
                        ),
                        onPressed: widget.onSave),
                  ],
                ),
              ],
            ),
            widget.itTag
                ? Container()
                : MyBottom(
                    child: Text('Ajouter un tag'),
                    onPressed: () async {
                      MyPages.Tagselected = await tagPicker();
                    })
          ],
        ),
      ),
    );
  }
}
