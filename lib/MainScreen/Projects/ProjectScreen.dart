// ignore_for_file: must_be_immutable

import "package:azaproject/Util/Colors.dart";

// ignore: unused_import
import "package:azaproject/Util/ProjectStarted.dart";
// ignore: unused_import
import "package:azaproject/Util/ProjectToDo_tile.dart";
import "package:flutter/material.dart";

class ProjectScreen extends StatefulWidget {
  final List<List<dynamic>> ProjectListAFaire;
  final List<List<dynamic>> ProjectListStarted;
  ProjectScreen({
    super.key,
    required this.ProjectListAFaire,
    required this.ProjectListStarted,
  });

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  MyColors couleur = new MyColors();
  int NombreProjet = 3;
  int Projetstarted = 1;
  int ProjetAFaire = 2;

  void _Projet(List ProjectDo, List ProjetStarted) {
    setState(() {
      NombreProjet = ProjectDo.length + ProjetStarted.length;
      Projetstarted = ProjetStarted.length;
      ProjetAFaire = ProjectDo.length;
    });
  }

  bool estBissextile(int year) {
    if (year % 4 == 0) {
      if (year % 400 == 0 || year % 100 != 0) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Projet(widget.ProjectListAFaire, widget.ProjectListStarted);
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime currentMonth = DateTime.now();
    int Selecteddate = currentMonth.day;
    List<int> monthDay = [];

    switch (currentMonth.month) {
      case DateTime.january:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
      case DateTime.february:
        if (estBissextile(currentMonth.year)) {
          for (int i = 1; i <= 29; i++) monthDay.add(i);
        } else {
          for (int i = 1; i <= 28; i++) monthDay.add(i);
        }
        break;
      case DateTime.march:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
      case DateTime.april:
        for (int i = 1; i <= 30; i++) monthDay.add(i);
        break;
      case DateTime.may:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
      case DateTime.june:
        for (int i = 1; i <= 30; i++) monthDay.add(i);
        break;
      case DateTime.july:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
      case DateTime.august:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
      case DateTime.september:
        for (int i = 1; i <= 30; i++) monthDay.add(i);
        break;
      case DateTime.october:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
      case DateTime.november:
        for (int i = 1; i <= 30; i++) monthDay.add(i);
        break;
      case DateTime.december:
        for (int i = 1; i <= 31; i++) monthDay.add(i);
        break;
    }

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

    // ignore: unused_local_variable
    String formattedDate =
        " $Day le ${currentDate.day} à ${currentDate.hour}h${currentDate.minute}min";

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Aujourd\'hui vous avez ',
                        style: TextStyle(
                            color: couleur.SecondaryColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$NombreProjet',
                        style: TextStyle(
                            color: couleur.TertiaryColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' projet',
                        style: TextStyle(
                            color: couleur.SecondaryColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListTile(
              title: SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: monthDay.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Selecteddate = index - 1;
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.all(15),
                        width: 50,
                        height: 60,
                        child: Center(
                          child: Text(
                            '${monthDay[index]}',
                            style: TextStyle(
                              color: monthDay[index] == Selecteddate
                                  ? couleur.TertiaryColors
                                  : couleur.SecondaryColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: monthDay[index] == Selecteddate
                                ? couleur.primarycolors
                                : couleur.SecondaryColors,
                          ),
                          color: monthDay[index] == Selecteddate
                              ? couleur.SecondaryColors
                              : couleur.primarycolors,
                        ),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        'À FAIRE : ',
                        style: TextStyle(
                            color: couleur.SecondaryColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$ProjetAFaire',
                        style: TextStyle(
                            backgroundColor: couleur.TertiaryColors,
                            color: couleur.primarycolors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.ProjectListAFaire.length,
              itemBuilder: (context, index) {
                return ProjectTile(
                    Titre: widget.ProjectListAFaire[index][0],
                    date: formattedDate,
                    sous_titre: widget.ProjectListAFaire[index][1],
                    lieux: widget.ProjectListAFaire[index][2]);
              },
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Commencer :',
                            style: TextStyle(
                                color: couleur.SecondaryColors,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '$Projetstarted',
                          style: TextStyle(
                              backgroundColor: couleur.TertiaryColors,
                              color: couleur.primarycolors,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.ProjectListStarted.length,
            itemBuilder: (context, index) {
              return ProjectStarted(
                title: widget.ProjectListStarted[index][0],
                Date: '$formattedDate',
                subtitle: widget.ProjectListStarted[index][1],
              );
            },
          )),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
