import 'package:azaproject/List/Note.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/Notes_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NotesScreen extends StatefulWidget {
  static List NotesFiltre = [];
  static final box = Hive.box('TaskDo');
  const NotesScreen({
    super.key,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  int notes = 0;
  final NoteData _noteData = NoteData();
  //Reference de la base de donnée

  void verificatedeletedNote(int index) {
    setState(() {
      NotesScreen.NotesFiltre.removeAt(index);
      _notes(NotesScreen.NotesFiltre);
    });
  }

  @override
  void initState() {
    super.initState();

    if (NotesScreen.box.get('NoteList') == null) {
      _noteData.initData();
    } else {
      _noteData.chargementData();
    }
    NotesScreen.NotesFiltre = NoteData.NoteList;
    _notes(NotesScreen.NotesFiltre);
  }

  void _notes(List noteslist) {
    notes = noteslist.length;
  }

  void deleteNote(int index) {
    List temp = NotesScreen.NotesFiltre[index];
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
      _notes(NotesScreen.NotesFiltre);
    });
    _noteData.modifiactionList();
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
          itemCount: NotesScreen.NotesFiltre.length,
          itemBuilder: (BuildContext context, int index) {
            return MyNotes(
              Title: NotesScreen.NotesFiltre[index][0],
              Description: NotesScreen.NotesFiltre[index][1],
              onTapped: () => deleteNote(index),
              notes: NotesScreen.NotesFiltre,
              index: index,
              formattedDate: NotesScreen.NotesFiltre[index][2],
            );
          },
        ))
      ],
    );
  }
}
