import 'package:azaproject/MainScreen/Notes/NotesAdd.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyNotes extends StatelessWidget {
  final String Title;
  final String Description;
  Function()? onTapped;
  final List notes;
  final int index;
  final String formattedDate;
  MyNotes(
      {super.key,
      required this.Title,
      required this.Description,
      this.onTapped,
      required this.notes,
      required this.index,
      required this.formattedDate});

  @override
  Widget build(BuildContext context) {
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
                    style: Fonts.boldSecondary,
                    children: [
                      TextSpan(text: Description, style: Fonts.regularSecondary)
                    ])),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Edité le ' + formattedDate,
                  style: Fonts.regularSecondarySmall),
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
