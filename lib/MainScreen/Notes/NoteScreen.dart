import 'package:azaproject/List/Note.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/Notes_tile.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({
    super.key,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  int notes = 0;
  void verificatedeletedNote(int index) {
    setState(() {
      NoteList.removeAt(index);
      _notes(NoteList);
    });
  }

  @override
  void initState() {
    super.initState();
    _notes(NoteList);
  }

  void _notes(List noteslist) {
    notes = noteslist.length;
  }

  void deleteNote(int index) {
    List temp = NoteList[index];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: couleur.SecondaryColors,
      content: Text(
        'Etes-vous sûr de vouloir supprimer \'${temp[0]}\'',
        style: Fonts.boldPrimary,
      ),
      action: SnackBarAction(
          label: 'OUI', onPressed: () => verificatedeletedNote(index)),
    ));
    setState(() {
      _notes(NoteList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Notes', style: Fonts.boldSecondaryBig),
              Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: couleur.TertiaryColors),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2, left: 5, right: 5),
                  child: Text(
                    '$notes',
                    style: Fonts.boldPrimaryMid,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: NoteList.length,
          itemBuilder: (BuildContext context, int index) {
            return MyNotes(
              Title: NoteList[index][0],
              Description: NoteList[index][1],
              onTapped: () => deleteNote(index),
              notes: NoteList,
              index: index,
              formattedDate: NoteList[index][2],
            );
          },
        ))
      ],
    );
  }
}
