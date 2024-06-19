import 'package:azaproject/List/Task.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Dialog_Box.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MyBottom.dart';
import 'package:azaproject/Util/Task_tile.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class TaskScreen extends StatefulWidget {
  static List TaskFiltre = [];
  static List option = [];
  //Reference de la base de donnée
  static final box = Hive.box('TaskDo');
  const TaskScreen({
    super.key,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  MyColors couleur = MyColors();
  int taches = 0;
  TextEditingController controller = TextEditingController();
  Taskdata db = Taskdata();
  TextEditingController tagController = TextEditingController();
  int tag = 0;
  int tagAddanSupp = 0;
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
    tag = 0;
    //A la prémière ouverture de l app
    if (TaskScreen.box.get('Tasklist') == null ||
        TaskScreen.box.get('TagList') == null) {
      db.InitData();
    } else {
      db.chargementData();
    }
    TaskScreen.TaskFiltre = Taskdata.TaskList;
    TaskScreen.option = Taskdata.TagList;
    _taches(Taskdata.TaskList);
  }

// Modification de date

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
      db.modifiactionList();
      BoiteDialogue.contenu.clear();
    });
    Navigator.pop(context);
  }

  // Filtre de tâches

  void _filterTask() {
    if (tag != 0) {
      setState(() {
        TaskScreen.TaskFiltre =
            Taskdata.TaskList.where((item) => item[4] == tag).toList();
        _taches(TaskScreen.TaskFiltre);
      });
    } else {
      TaskScreen.TaskFiltre = Taskdata.TaskList;
      _taches(TaskScreen.TaskFiltre);
    }
  }

  void refreshTaskList() {
    setState(() {});
  }

  // Checkbox
  void checkBoxChange(int index, bool? value) {
    List tempList;
    if (value != false) {
      tempList = TaskScreen.TaskFiltre[index];
      setState(() {
        TaskScreen.TaskFiltre[index][1] = !TaskScreen.TaskFiltre[index][1];
        TaskScreen.TaskFiltre.removeAt(index);
        TaskScreen.TaskFiltre.add(tempList);
      });
    } else {
      tempList = TaskScreen.TaskFiltre[index];
      setState(() {
        TaskScreen.TaskFiltre[index][1] = !TaskScreen.TaskFiltre[index][1];
      });
      for (var i = index; i > 0; i--) {
        setState(() {
          TaskScreen.TaskFiltre[i] = TaskScreen.TaskFiltre[i - 1];
        });
      }

      TaskScreen.TaskFiltre[0] = tempList;
    }

    db.modifiactionList();
  }

  _taches(List tachelist) {
    taches = Taskdata.TaskList.length;
  }

  void BookmarkTap(int index) {
    setState(() {
      TaskScreen.TaskFiltre[index][2] = !TaskScreen.TaskFiltre[index][2];
    });
    db.modifiactionList();
  }

  //supprimer la tâche
  void DeleteTask(int index) {
    setState(() {
      TaskScreen.TaskFiltre.removeAt(index);
      _taches(Taskdata.TaskList);
    });
    db.modifiactionList();
  }

  void refresh() {
    // Cette méthode est appelée pour déclencher le rafraîchissement du widget
    setState(() {});
  }

  // Tag

  Future<void> tagPicker() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: couleur.TertiaryColors,
            actions: [
              MyBottom(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('annuler')),
              MyBottom(
                  onPressed: () {
                    supprimeTag(tagAddanSupp);
                  },
                  child: const Text('Supprimer')),
              MyBottom(onPressed: ajoutTag, child: const Text('ajouter'))
            ],
            title: Text(
              "Tag",
              style: Fonts.boldSecondaryMid,
            ),
          );
        });
  }

  // Delete

  void supprimeTag(int tag) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Supprimer"),
            content: ChipsChoice.single(
              value: tagAddanSupp,
              onChanged: (value) {
                setState(() {
                  tagAddanSupp = value;
                  TaskScreen.option.removeAt(tagAddanSupp);
                });
                Navigator.pop(context);
              },
              choiceItems: C2Choice.listFrom(
                  source: TaskScreen.option,
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
  }

  

  // Add

  void ajoutTag() {
    showDialog(
        context: context,
        builder: (context) {
          return BoiteDialogue(
            controller: tagController,
            onSave: () {
              if (Taskdata.DoubleTag(tagController.text) ) {
                setState(() {
                  TaskScreen.option.add(tagController.text);
                });
                print(TaskScreen.option);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyPages(
                            indice: 0,
                          )));
              }
            },
            onCancel: () {
              Navigator.pop(context);
            },
            Label1: 'Sauvegarde',
            Label2: 'cancel',
            itTag: true,
          );
        });
    db.modifiactionList();
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Tâches', style: Fonts.boldSecondaryBig),
                      Container(
                        margin: const EdgeInsets.all(5),
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
                  IconButton(
                      onPressed: tagPicker,
                      icon: const Icon(
                        Icons.bookmark_add,
                        color: Color.fromARGB(255, 06, 79, 96),
                      ))
                ],
              ),
              Column(
                children: [
                  ChipsChoice.single(
                    value: tag,
                    onChanged: (value) => setState(() {
                      tag = value;
                      _filterTask();
                    }),
                    choiceItems: C2Choice.listFrom(
                        source: TaskScreen.option,
                        value: ((index, item) => index),
                        label: ((index, item) => item)),
                    choiceActiveStyle: const C2ChoiceStyle(
                        backgroundColor: Color.fromARGB(255, 06, 79, 96),
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
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
                  )
                ],
              )
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
