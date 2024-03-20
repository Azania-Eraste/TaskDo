import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Notes_tile.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  final List<List<dynamic>> NoteList;
  NotesScreen({
    super.key,
    required this.NoteList,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  void DeleteNote(int index) {
    setState(() {
      widget.NoteList.removeAt(index);
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
              Text(
                'Notes',
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
          itemCount: widget.NoteList.length,
          itemBuilder: (BuildContext context, int index) {
            return MyNotes(
              Title: widget.NoteList[index][0],
              Description: widget.NoteList[index][1],
              onTapped: () => DeleteNote(index),
              notes: widget.NoteList,
              index: index,
            );
          },
        ))
      ],
    );
  }
}
