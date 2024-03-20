import 'package:azaproject/Util/CalendarState.dart';

import 'package:flutter/material.dart';

class NotesAdd extends StatefulWidget {
  final List? notes;
  final int? index;
  NotesAdd({super.key, this.notes, this.index});

  @override
  State<NotesAdd> createState() => _NotesAddState();
}

class _NotesAddState extends State<NotesAdd> {
  TextEditingController Titrecontrolleur = new TextEditingController();
  TextEditingController Contenucontrolleur = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.notes != null) {
      Titrecontrolleur =
          TextEditingController(text: widget.notes![widget.index!][0]);
      Contenucontrolleur =
          TextEditingController(text: widget.notes![widget.index!][1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleur.Screen,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: couleur.SecondaryColors,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 125.0),
                  child: Text(
                    'Créer',
                    style: TextStyle(
                        color: couleur.SecondaryColors,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  child: TextField(
                    controller: Titrecontrolleur,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Titre',
                        hintStyle: TextStyle(
                            color: couleur.SecondaryColors, fontSize: 30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  child: TextField(
                    maxLines: 100,
                    controller: Contenucontrolleur,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Commencer à écrire',
                        hintStyle: TextStyle(
                            color: couleur.SecondaryColors, fontSize: 15)),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: couleur.SecondaryColors,
        elevation: 10,
        onPressed: () {
          Navigator.pop(
              context, [Titrecontrolleur.text, Contenucontrolleur.text]);
        },
        child: Icon(
          Icons.save,
          color: couleur.TertiaryColors,
        ),
      ),
    );
  }
}
