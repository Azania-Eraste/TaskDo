import 'package:azaproject/MainScreen/Calendar/CalendarAdd.dart';
import 'package:azaproject/MainScreen/Calendar/CalendarScreen.dart';
import 'package:azaproject/MainScreen/Map/MapScreen.dart';
import 'package:azaproject/MainScreen/Notes/NoteScreen.dart';
import 'package:azaproject/MainScreen/Notes/NotesAdd.dart';
import 'package:azaproject/MainScreen/Projects/ProjectAdd.dart';
import 'package:azaproject/MainScreen/Projects/ProjectScreen.dart';
import 'package:azaproject/MainScreen/Tasks/TaskScreen.dart';
import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Dialog_Box.dart';

import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyPages extends StatefulWidget {
  const MyPages({Key? key}) : super(key: key);

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late List<List<dynamic>> TaskList;
  late List<List<dynamic>> NoteList;
  late List<List<dynamic>> ProjectListAFaire;
  late List<List<dynamic>> ProjectListStarted;
  TextEditingController controller = TextEditingController();
  MyColors couleur = MyColors();

  late List<List<dynamic>> meetings;

  //list des pages
  late List<Widget> pages;

  int _selectedIndex = 0;
  void SaveNewTask() {
    setState(() {
      TaskList.add([controller.text, false, false]);
      controller.clear();
    });
    TaskScreen.taskKey.currentState?.refreshTaskList();
    Navigator.pop(context);
  }

  void CreateNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return BoiteDialogue(
            controller: controller,
            OnSave: SaveNewTask,
            OnCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  void _navigationBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFloatingActionButton() {
    switch (_selectedIndex) {
      case 0:
        // Page Projet
        return FloatingActionButton(
          backgroundColor: couleur.TertiaryColors,
          onPressed: () async {
            // Logique pour la page Notes
            // ignore: unused_local_variable
            final results = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProjectAdd()));
          },
          child: Icon(
            Icons.add,
            color: couleur.SecondaryColors,
            size: 45,
          ),
        );
      case 1:
        // Page Tâches
        return FloatingActionButton(
          backgroundColor: couleur.TertiaryColors,
          onPressed: () {
            // Logique pour la page Tâches
            CreateNewTask();
          },
          child: Icon(
            Icons.add,
            color: couleur.SecondaryColors,
            size: 45,
          ),
        );
      case 2:
        // Page Calendrier
        // Pas de bouton flottant pour la page Calendrier, donc retourne un conteneur vide
        return Container();
      case 3:
        // Page Notes
        return FloatingActionButton(
          backgroundColor: couleur.TertiaryColors,
          onPressed: () async {
            // Logique pour la page Notes
            final result = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => NotesAdd()));
            if (result != null) {
              setState(() {
                NoteList.add([result[0], result[1]]);
              });
            }
          },
          child: Icon(
            Icons.add,
            color: couleur.SecondaryColors,
            size: 45,
          ),
        );
      case 4:
        // Page Map
        return Container();
      default:
        // Par défaut, retourne un conteneur vide
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();

    //Initialiser lalist des taches
    TaskList = [
      ["Make tutorial", false, false],
      ["AZA", false, false],
      ["azania", false, false],
    ];
    //Initialiser la liste des notes
    NoteList = [
      ["Aza", "aza"],
      ["Azania", "azania"]
    ];
    //Initialiser la liste des projets à faire
    ProjectListAFaire = [
      ['Flutter', 'Activité spé', 'IIT'],
      ['Java', 'Cours', 'IIT'],
      ['Python', 'TP', 'L3SI']
    ];
    //Initialiser la liste des projet commencer
    ProjectListStarted = [
      ['Revision', 'Cours'],
      ['Apprentissage du dart', 'Activité spéciale'],
      ['TaskDo', 'Projet']
    ];
    // Initialiser la liste meetings
    meetings = [
      [
        'aza',
        DateTime.now(),
        DateTime.now().add(
          Duration(hours: 2),
        )
      ]
    ];

    // Initialiser pages après la création de TaskList
    pages = [
      ProjectScreen(
        ProjectListAFaire: ProjectListAFaire,
        ProjectListStarted: ProjectListStarted,
      ),
      TaskScreen(
        TaskList: TaskList,
      ),
      CalendarScreen(
        formatedate: formatSelected,
      ),
      NotesScreen(
        NoteList: NoteList,
      ),
      MapScreen(),
    ];
  }

  static const FormatCalendirer = <String>[
    'Journalier',
    'Journalier(Timeline)',
    'Hebdomadaire(Timeline)',
    'Hebdomadaire',
    'Mensuel',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems =
      FormatCalendirer.map((String text) => DropdownMenuItem(
            child: Text(text),
            value: text,
          )).toList();
  String? formatSelected = 'Journalier';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor:
            _selectedIndex != 2 ? couleur.Screen : couleur.TertiaryColors,
        title: _selectedIndex != 2
            ? Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: MyTextField(
                  Radius: 40,
                  text: 'Rechercher',
                  icon: Icons.search,
                  Iconsize: 24,
                  fillcolor: couleur.primarycolors,
                  PasswordChar: false,
                ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      // ignore: unused_local_variable
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalendarAdd()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: couleur.SecondaryColors,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: DropdownButton(
                      items: this._dropDownMenuItems,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            formatSelected = newValue;
                          });
                        }
                      },
                      hint: Icon(
                        Icons.calendar_month,
                        color: couleur.SecondaryColors,
                      ),
                    ),
                  )
                ],
              ),
      ),
      backgroundColor: couleur.Screen,
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: couleur.SecondaryColors,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: GNav(
            iconSize: 30,
            padding: EdgeInsets.all(16),
            tabBorderRadius: 20,
            tabBackgroundColor: couleur.TertiaryColors,
            onTabChange: (index) => _navigationBar(index),
            backgroundColor: couleur.SecondaryColors,
            gap: 8,
            activeColor: couleur.primarycolors,
            color: Colors.grey,
            tabs: const [
              GButton(
                icon: Icons.square_outlined,
                text: 'Projet',
              ),
              GButton(
                icon: Icons.toc_outlined,
                text: 'Tâches',
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                text: 'Calendrier',
              ),
              GButton(
                icon: Icons.note,
                text: 'Notes',
              ),
              GButton(
                icon: Icons.map_outlined,
                text: 'Map',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
