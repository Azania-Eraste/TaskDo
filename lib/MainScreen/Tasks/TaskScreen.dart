import 'package:azaproject/List/Task.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Dialog_Box.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/Task_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TaskScreen extends StatefulWidget {
  static GlobalKey<_TaskScreenState> taskKey = GlobalKey<_TaskScreenState>();
  static List<List<dynamic>> TaskFiltre = [];
  TaskScreen({
    super.key,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  MyColors couleur = new MyColors();
  int taches = 0;
  TextEditingController controller = new TextEditingController();

  //Reference de la base de donnée
  final _box = Hive.box('TaskDo');

  //Liste des taches

  @override
  void initState() {
    super.initState();
    TaskScreen.TaskFiltre = TaskList;
    _taches(TaskList);
  }

  String modifyDate(int index, String formattedDate) {
    if (MyPages.rappelDate != null) {
      return formattedDate;
    }
    return TaskScreen.TaskFiltre[index][3];
  }

  void ModifierTache(int index) {
    String Day = 'a';
    String formattedDate = '';
    if (MyPages.rappelDate != null) {
      switch (MyPages.rappelDate!.weekday) {
        case 1:
          Day = 'Lun.';
          break;
        case 2:
          Day = 'Mar.';
          break;
        case 3:
          Day = 'Mer.';
          break;
        case 4:
          Day = 'Jeu.';
          break;
        case 5:
          Day = 'Ven.';
          break;
        case 6:
          Day = 'Sam.';
          break;
        case 7:
          Day = 'Dim.';
          break;
      }
      formattedDate =
          "$Day le ${MyPages.rappelDate!.day} à ${MyPages.rappelDate!.hour}h${MyPages.rappelDate!.minute}min";
    }
    setState(() {
      if (index == TaskScreen.TaskFiltre.length - 1) {
        TaskScreen.TaskFiltre[index][0] = BoiteDialogue.contenu.text;
        if (MyPages.rappelDate != null) {
          TaskScreen.TaskFiltre[index][3] = formattedDate;
        }
      } else {
        TaskScreen.TaskFiltre.removeAt(index);
        TaskScreen.TaskFiltre.insert(index, [
          BoiteDialogue.contenu.text,
          TaskScreen.TaskFiltre[index][1],
          TaskScreen.TaskFiltre[index][2],
          modifyDate(index, formattedDate)
        ]);
      }
      BoiteDialogue.contenu.clear();
    });
    Navigator.pop(context);
  }

  void refreshTaskList() {
    setState(() {});
  }

  // Checkbox
  void checkBoxChange(int index, bool? value) {
    setState(() {
      TaskScreen.TaskFiltre[index][1] = !TaskScreen.TaskFiltre[index][1];
    });
  }

  _taches(List tachelist) {
    taches = TaskList.length;
  }

  void BookmarkTap(int index) {
    setState(() {
      TaskScreen.TaskFiltre[index][2] = !TaskScreen.TaskFiltre[index][2];
    });
  }

  //supprimer la tâche
  void DeleteTask(int index) {
    setState(() {
      TaskScreen.TaskFiltre.removeAt(index);
      _taches(TaskList);
    });
  }

  void refresh() {
    // Cette méthode est appelée pour déclencher le rafraîchissement du widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Tâches', style: Fonts.boldSecondaryBig),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: couleur.TertiaryColors),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2, left: 5, right: 5),
                  child: Text(
                    '$taches',
                    style: Fonts.boldPrimaryMid,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: TaskScreen.TaskFiltre.length,
            itemBuilder: (context, index) {
              return TaskTile(
                TacheTitre: TaskScreen.TaskFiltre[index][0],
                isDone: TaskScreen.TaskFiltre[index][1],
                OnChanged: (value) => checkBoxChange(index, value),
                OnPressed: () => BookmarkTap(index),
                check: TaskScreen.TaskFiltre[index][2],
                date: TaskScreen.TaskFiltre[index][3],
                deleteTask: (Context) => DeleteTask(index),
                task: TaskScreen.TaskFiltre,
                index: index,
                controller: controller,
                OnModify: () {
                  ModifierTache(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
