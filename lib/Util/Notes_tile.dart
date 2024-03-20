import 'package:azaproject/MainScreen/Notes/NotesAdd.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyNotes extends StatelessWidget {
  final String Title;
  final String Description;
  Function()? onTapped;
  final List notes;
  final int index;
  MyNotes(
      {super.key,
      required this.Title,
      required this.Description,
      this.onTapped,
      required this.notes,
      required this.index});

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
        " $Day  ${currentDate.day}/${currentDate.month}/${currentDate.year} à ${currentDate.hour}h${currentDate.minute}min";

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
                strokeAlign: BorderSide.strokeAlignCenter,
                color: couleur.SecondaryColors,
                width: 2)),
        color: couleur.primarycolors,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            onTap: () async {
              // ignore: unused_local_variable
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotesAdd(
                            notes: notes,
                            index: index,
                          )));
            },
            title: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: Title + '\n',
                    style: TextStyle(
                        color: couleur.SecondaryColors,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 1.8),
                    children: [
                      TextSpan(
                          text: Description,
                          style: TextStyle(
                              color: couleur.SecondaryColors,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.4))
                    ])),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Edité le ' + formattedDate,
                style: TextStyle(
                    color: couleur.SecondaryColors,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: GestureDetector(
              onTap: onTapped,
              child: Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}
