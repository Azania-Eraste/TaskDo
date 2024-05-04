import 'package:azaproject/List/Task.dart';
import 'package:azaproject/MainScreen/Calendar/calendarAdd.dart';
import 'package:azaproject/MainScreen/Calendar/CalendarScreen.dart';
import 'package:azaproject/MainScreen/Map/MapScreen.dart';
import 'package:azaproject/MainScreen/Notes/NoteScreen.dart';
import 'package:azaproject/MainScreen/Notes/NotesAdd.dart';
import 'package:azaproject/MainScreen/Projects/ProjectAdd.dart';
import 'package:azaproject/MainScreen/Projects/ProjectScreen.dart';
import 'package:azaproject/MainScreen/Tasks/TaskScreen.dart';
import 'package:azaproject/Service/User.dart';

import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Dialog_Box.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class MyPages extends StatefulWidget {
  final int? indice;
  static String formatSelected = 'Journalier';
  static DateTime? rappelDate;
  const MyPages({super.key, this.indice = -1});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  TextEditingController search = TextEditingController();
  TextEditingController controller = TextEditingController();
  MyColors couleur = MyColors();
  late double paddingsearch = 0.0;

  //list des pages
  late List<Widget> pages;

  int _selectedIndex = 0;
  void ajoutTaches() {
    String day = 'a';
    String formattedDate = '';
    if (MyPages.rappelDate != null) {
      switch (MyPages.rappelDate!.weekday) {
        case 1:
          day = 'Lun.';
          break;
        case 2:
          day = 'Mar.';
          break;
        case 3:
          day = 'Mer.';
          break;
        case 4:
          day = 'Jeu.';
          break;
        case 5:
          day = 'Ven.';
          break;
        case 6:
          day = 'Sam.';
          break;
        case 7:
          day = 'Dim.';
          break;
      }
      formattedDate =
          "$day le ${MyPages.rappelDate!.day} à ${MyPages.rappelDate!.hour}h${MyPages.rappelDate!.minute}min";
    }
    String nom = controller.text;

    if (controller.text.isNotEmpty) {
      setState(() {
        TaskList.add([nom, false, false, formattedDate]);
      });
    }
    controller.clear();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyPages(
                  indice: 1,
                )));
  }

  void creationTache() {
    showDialog(
        context: context,
        builder: (context) {
          return BoiteDialogue(
            controller: controller,
            onSave: ajoutTaches,
            onCancel: () {
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

  void onSearch(String searchText) {
    switch (_selectedIndex) {
      case 0:
        break;
      case 1:
        setState(() {
          TaskScreen.TaskFiltre = TaskList.where((element) {
            String search = element[0];

            return search.toLowerCase().contains(searchText.toLowerCase());
          }).toList();
        });

        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
    }
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
          onPressed: () async {
            // Logique pour la page Tâches
            creationTache();
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
          onPressed: () {
            // Logique pour la page Notes
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NotesAdd()));
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

    //Rechargement de la page
    if (widget.indice! >= 0) {
      setState(() {
        _selectedIndex = widget.indice!;
      });
    }

    paddingsearch = 260;

    // Initialiser pages après la création de TaskList
    pages = [
      ProjectScreen(),
      TaskScreen(),
      const CalendarScreen(),
      const NotesScreen(),
      const MapScreen(),
    ];
  }

  static const formatCalendirer = <String>[
    'Journalier',
    'Journalier(Timeline)',
    'Hebdomadaire(Timeline)',
    'Hebdomadaire',
    'Mensuel',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = formatCalendirer
      .map((String text) => DropdownMenuItem(
            value: text,
            child: Text(text),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: couleur.SecondaryColors),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    User.name,
                    style: Fonts.boldSecondaryMid,
                  ),
                ),
              ],
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    'Compte',
                    style: Fonts.boldSecondary,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text(
                'Confidentialité',
                style: Fonts.boldSecondary,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Paramètre',
                style: Fonts.boldSecondary,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Aide et bug',
                style: Fonts.boldSecondary,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: _selectedIndex == 4
          ? null
          : AppBar(
              primary: true,
              automaticallyImplyLeading: false,
              backgroundColor: _selectedIndex != 2
                  ? couleur.Screen
                  : couleur.SecondaryColors,
              title: _selectedIndex != 2
                  ? SafeArea(
                      child: Row(
                      children: [
                        const DrawerButton(
                          style: ButtonStyle(
                              animationDuration: Duration(milliseconds: 500),
                              iconColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 06, 79, 96))),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 5,
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: MyTextField(
                              HintStyle: Fonts.regularSecondary,
                              controller: search,
                              onChanged: onSearch,
                              Radius: 40,
                              text: 'Rechercher',
                              style: Fonts.regularBlack,
                              suffixicon: Icons.search,
                              suffixIconsize: 24,
                              fillcolor: couleur.primarycolors,
                              PasswordChar: false,
                            ),
                          ),
                        ),
                      ],
                    ))
                  : SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () async {
                              // ignore: unused_local_variable
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CalendarAdd()));
                            },
                            icon: Icon(
                              Icons.add,
                              color: couleur.TertiaryColors,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            child: DropdownButton(
                              items: _dropDownMenuItems,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    MyPages.formatSelected = newValue;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyPages(
                                                indice: 2,
                                              )));
                                }
                              },
                              icon: Icon(
                                Icons.calendar_month,
                                color: couleur.TertiaryColors,
                              ),
                              elevation: 0,
                            ),
                          )
                        ],
                      ),
                    )),
      backgroundColor: couleur.Screen,
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: couleur.SecondaryColors,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: GNav(
            selectedIndex: _selectedIndex,
            iconSize: 30,
            padding: const EdgeInsets.all(16),
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
                icon: Icons.note_outlined,
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
