import 'package:azaproject/List/Note.dart';
import 'package:azaproject/MainScreen/Notes/NoteScreen.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NotesAdd extends StatefulWidget {
  final List? notes;
  final int? index;
  const NotesAdd({super.key, this.notes, this.index});

  @override
  State<NotesAdd> createState() => _NotesAddState();
}

class _NotesAddState extends State<NotesAdd> {
  TextEditingController Titrecontrolleur = TextEditingController();
  TextEditingController Contenucontrolleur = TextEditingController();
  FocusNode titleFocusNode = FocusNode();
  final NoteData _noteData = NoteData();
  final _box = Hive.box('TaskDo');

  @override
  void initState() {
    super.initState();
    if (widget.notes != null) {
      Titrecontrolleur =
          TextEditingController(text: widget.notes![widget.index!][0]);
      Contenucontrolleur =
          TextEditingController(text: widget.notes![widget.index!][1]);
    }
    if (_box.get('NoteList') == null) {
      _noteData.initData();
    } else {
      _noteData.chargementData();
    }
  }

  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    // Definir les items du menu contextuel
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

    void Focus() {
      if (Titrecontrolleur.text.isNotEmpty ||
          Contenucontrolleur.text.isNotEmpty) {
        setState(() {
          hasFocus = true;
        });
      } else {
        setState(() {
          hasFocus = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: couleur.Screen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: hasFocus == false
            ? Text('Créer', style: Fonts.boldSecondaryMid)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  Text('Créer', style: Fonts.boldSecondaryMid),
                  IconButton(
                      onPressed: () {
                        if (widget.notes != null) {
                          NotesScreen.NotesFiltre[widget.index!][0] =
                              Titrecontrolleur.text;
                          NotesScreen.NotesFiltre[widget.index!][1] =
                              Contenucontrolleur.text;
                          NotesScreen.NotesFiltre[widget.index!][2] =
                              formattedDate;
                        } else {
                          if (Titrecontrolleur.text.isNotEmpty ||
                              Contenucontrolleur.text.isNotEmpty) {
                            NotesScreen.NotesFiltre.add([
                              Titrecontrolleur.text,
                              Contenucontrolleur.text,
                              formattedDate
                            ]);
                          }
                        }
                        _noteData.modifiactionList();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPages(
                                      indice: 2,
                                    )));
                      },
                      icon: Icon(
                        Icons.save,
                        color: couleur.SecondaryColors,
                      ))
                ],
              ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: couleur.SecondaryColors,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                    child: TextField(
                      onChanged: (value) {
                        Focus();
                      },
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 40),
                      controller: Titrecontrolleur,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Titre',
                          hintStyle: Fonts.boldSecondaryBig),
                      focusNode: titleFocusNode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                    child: TextField(
                      onChanged: (value) {
                        Focus();
                      },
                      maxLines: 100,
                      controller: Contenucontrolleur,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Commencer à écrire',
                          hintStyle: Fonts.boldSecondary),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
