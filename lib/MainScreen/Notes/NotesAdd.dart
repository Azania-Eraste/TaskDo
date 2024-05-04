import 'package:azaproject/List/Note.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    if (widget.notes != null) {
      Titrecontrolleur =
          TextEditingController(text: widget.notes![widget.index!][0]);
      Contenucontrolleur =
          TextEditingController(text: widget.notes![widget.index!][1]);
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
                          NoteList[widget.index!][0] = Titrecontrolleur.text;
                          NoteList[widget.index!][1] = Contenucontrolleur.text;
                          NoteList[widget.index!][2] = formattedDate;
                        } else {
                          if (Titrecontrolleur.text.isNotEmpty ||
                              Contenucontrolleur.text.isNotEmpty) {
                            NoteList.add([
                              Titrecontrolleur.text,
                              Contenucontrolleur.text,
                              formattedDate
                            ]);
                          }
                        }
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPages(
                                      indice: 3,
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
            hasFocus
                ? Container(
                    color: couleur.SecondaryColors,
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.image,
                              size: 40,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.text_decrease,
                            size: 40,
                          ),
                          onTap: () {
                            setState(() {
                              // Diminuez la taille de la police de la sélection dans le titre
                              if (!Titrecontrolleur.selection.isCollapsed) {
                                String selectedText = Titrecontrolleur.selection
                                    .textInside(Titrecontrolleur.text);
                              }
                            });
                          },
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.text_increase,
                            size: 40,
                          ),
                          onTap: () {
                            setState(() {
                              // Augmentez la taille de la police de la sélection dans le titre
                              if (!Titrecontrolleur.selection.isCollapsed) {
                                String selectedText = Titrecontrolleur.selection
                                    .textInside(Titrecontrolleur.text);
                              } else if (!Contenucontrolleur
                                  .selection.isCollapsed) {
                                String selectedText = Contenucontrolleur
                                    .selection
                                    .textInside(Contenucontrolleur.text);
                              }
                            });
                          },
                        ),
                        GestureDetector(
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.text_format,
                              size: 44,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.format_color_text_rounded,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
