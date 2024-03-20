// ignore_for_file: must_be_immutable
import "package:azaproject/Util/Colors.dart";
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
  TaskTile(
      {super.key,
      required this.TacheTitre,
      required this.isDone,
      required this.OnChanged,
      required this.OnPressed,
      required this.check,
      required this.date,
      required this.deleteTask});
  MyColors couleur = new MyColors();

  @override
  Widget build(BuildContext context) {
    //date de création

    return Padding(
      padding: EdgeInsets.only(top: 24, left: 27),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            foregroundColor: couleur.SecondaryColors,
            label: 'Supprimer',
            backgroundColor: couleur.TertiaryColors,
            borderRadius: BorderRadius.circular(10),
          ),
        ]),
        child: Container(
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
      ),
    );
  }
}
