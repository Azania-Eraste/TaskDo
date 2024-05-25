// ignore_for_file: must_be_immutable
import "package:azaproject/Util/Colors.dart";
import "package:azaproject/Util/Dialog_Box.dart";
import "package:azaproject/Util/IconState.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class TaskTile extends StatelessWidget {
  final String TacheTitre;
  final bool isDone;
  Function(bool?)? OnChanged;
  Function()? OnPressed;
  final bool check;
  final String date;
  Function(BuildContext)? deleteTask;
  final List task;
  final int index;
  final VoidCallback OnModify;
  final TextEditingController controller;
  TaskTile({
    super.key,
    required this.TacheTitre,
    required this.isDone,
    required this.OnChanged,
    required this.OnPressed,
    required this.check,
    required this.date,
    required this.deleteTask,
    required this.task,
    required this.index,
    required this.controller,
    required this.OnModify,
  });
  MyColors couleur =  MyColors();
  int getIndex() {
    return index;
  }

  @override
  Widget build(BuildContext context) {
    //date de création

    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 15, right: 15),
      child: Slidable(
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return BoiteDialogue(
                        task: task,
                        index: index,
                        controller: controller,
                        onSave: OnModify,
                        onCancel: () {
                          Navigator.pop(context);
                        });
                  });
            },
            icon: Icons.note,
            foregroundColor: couleur.TertiaryColors,
            backgroundColor: couleur.SecondaryColors,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            foregroundColor: couleur.SecondaryColors,
            backgroundColor: couleur.TertiaryColors,
            borderRadius: BorderRadius.circular(10),
          ),
        ]),
        child: Card(
            color: couleur.primarycolors,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: isDone
                      ? couleur.HintText
                      : check
                          ? couleur.TertiaryColors
                          : couleur.SecondaryColors,
                  width: 2,
                )),
            child: ListTile(
              title: Text(
                TacheTitre,
                style: TextStyle(
                    color: isDone
                        ? couleur.HintText
                        : check
                            ? couleur.TertiaryColors
                            : couleur.SecondaryColors,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontFamily: 'DMSans'),
              ),
              leading: Checkbox(
                focusColor: isDone
                    ? couleur.HintText
                    : check
                        ? couleur.TertiaryColors
                        : couleur.SecondaryColors,
                checkColor: isDone
                    ? couleur.HintText
                    : check
                        ? couleur.TertiaryColors
                        : couleur.SecondaryColors,
                value: isDone,
                onChanged: OnChanged,
                activeColor: isDone
                    ? couleur.HintText
                    : check
                        ? couleur.TertiaryColors
                        : couleur.SecondaryColors,
              ),
              trailing: MyIcon(
                iconFalse: Icons.bookmark_outline,
                icontrue: Icons.bookmark,
                onchanged: OnPressed,
                value: check,
                isDone: isDone,
              ),
              subtitle: Text(date,
                  style: TextStyle(
                      color: isDone
                          ? couleur.HintText
                          : check
                              ? couleur.TertiaryColors
                              : couleur.SecondaryColors,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans')),
            )),
      ),
    );
  }
}


/*Container(
          width: MediaQuery.of(context).size.width * .87,
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              
              //icon
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyIcon(
                    iconFalse: Icons.bookmark_outline,
                    icontrue: Icons.bookmark,
                    Onchanged: OnPressed,
                    value: check,
                  )
                ],
              ),
              Row(
                children: [
                  //checkBox
                  Checkbox(
                    focusColor: check
                        ? couleur.TertiaryColors
                        : couleur.SecondaryColors,
                    checkColor:
                        check ? couleur.SecondaryColors : couleur.primarycolors,
                    value: isDone,
                    onChanged: OnChanged,
                    activeColor: check
                        ? couleur.TertiaryColors
                        : couleur.SecondaryColors,
                  ),
                  //Titre
                  Text(
                    TacheTitre,
                    style: TextStyle(
                        color: check
                            ? couleur.TertiaryColors
                            : couleur.SecondaryColors,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(date,
                      style: TextStyle(
                        color: check
                            ? couleur.TertiaryColors
                            : couleur.SecondaryColors,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
              color: couleur.primarycolors,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: check
                      ? couleur.TertiaryColors
                      : couleur.SecondaryColors)),
        ),
        */