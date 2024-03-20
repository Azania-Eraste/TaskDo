import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Task_tile.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  final List<List<dynamic>> TaskList;
  static GlobalKey<_TaskScreenState> taskKey = GlobalKey<_TaskScreenState>();
  TaskScreen({
    super.key,
    required this.TaskList,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  MyColors couleur = new MyColors();

  //Methode pour rafraichir la page
  void refreshTaskList() {
    setState(() {});
  }

  // Checkbox
  void checkBoxChange(int index, bool? value) {
    setState(() {
      widget.TaskList[index][1] = widget.TaskList[index][1];
    });
  }

  void BookmarkTap(int index) {
    setState(() {
      widget.TaskList[index][2] = widget.TaskList[index][2];
    });
  }

  //supprimer la tâche
  void DeleteTask(int index) {
    setState(() {
      widget.TaskList.removeAt(index);
    });
  }

  void refresh() {
    // Cette méthode est appelée pour déclencher le rafraîchissement du widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String Day = 'a';
    switch (currentDate.weekday) {
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
    String formattedDate =
        " $Day le ${currentDate.day} à ${currentDate.hour}h${currentDate.minute}min";

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
              Text(
                'Tâches',
                style: TextStyle(
                    color: couleur.SecondaryColors,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.TaskList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                TacheTitre: widget.TaskList[index][0],
                isDone: widget.TaskList[index][1],
                OnChanged: (value) => checkBoxChange(index, value),
                OnPressed: () => BookmarkTap(index),
                check: widget.TaskList[index][2],
                date: '$formattedDate',
                deleteTask: (Context) => DeleteTask(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
