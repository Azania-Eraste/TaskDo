import "package:azaproject/Util/CalendarState.dart";
import "package:flutter/material.dart";

class ProjectAdd extends StatefulWidget {
  const ProjectAdd({super.key});

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  TextEditingController Titrecontrolleur = new TextEditingController();
  TextEditingController Contenucontrolleur = new TextEditingController();
  String nom = 'Aza';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: TextField(
                style: TextStyle(color: Colors.black87, fontSize: 40),
                decoration: InputDecoration(
                  hintText: 'Titre',
                  hintStyle:
                      TextStyle(color: couleur.SecondaryColors, fontSize: 40),
                  border: InputBorder.none,
                ),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      color: couleur.SecondaryColors,
                      fontSize: 25,
                    )),
                style: TextStyle(color: Colors.black87, fontSize: 25),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'Membre : ',
                        style: TextStyle(
                            color: couleur.SecondaryColors,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Créateur : ',
                        style: TextStyle(
                            color: couleur.SecondaryColors, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('$nom'),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    ));
  }
}
