import 'dart:io';
import 'package:azaproject/List/Task.dart';
import 'package:azaproject/MainScreen/Calendar/calendarAdd.dart';
import 'package:azaproject/MainScreen/Calendar/CalendarScreen.dart';
import 'package:azaproject/MainScreen/Map/MapScreen.dart';
import 'package:azaproject/MainScreen/Notes/NoteScreen.dart';
import 'package:azaproject/MainScreen/Notes/NotesAdd.dart';
import 'package:azaproject/MainScreen/Tasks/TaskScreen.dart';
import 'package:azaproject/Service/User.dart';
import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Dialog_Box.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:image_picker/image_picker.dart';

class MyPages extends StatefulWidget {
  final int? indice;
  static String formatSelected = 'Journalier';
  static DateTime? rappelDate;
  static int? Tagselected = -1;
  const MyPages({super.key, this.indice = -1});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  TextEditingController search = TextEditingController();
  TextEditingController controller = TextEditingController();
  MyColors couleur = MyColors();
  File? _image;
  Taskdata db = Taskdata();
  //list des pages
  late List<Widget> pages;

  Search ListSearch() {
    if (_selectedIndex == 2) {
      return Search(NotesScreen.NotesFiltre);
    }
    return Search(TaskScreen.TaskFiltre);
  }

  int _selectedIndex = 0;
  void ajoutTaches() {
    String day = 'a';
    String formattedDate = '';
    int? tagTask = 0;

    if (MyPages.Tagselected != -1) {
      tagTask = MyPages.Tagselected;
    }

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
        Taskdata.TaskList.add([nom, false, false, formattedDate, tagTask]);
        MyPages.rappelDate = null;
      });
    }
    db.modifiactionList();
    controller.clear();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyPages(
                  indice: 0,
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
            Label1: 'Sauvegarde',
            Label2: 'Definir un rappel',
            itTag: false,
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
            // Logique pour la page Tâches
            creationTache();
          },
          child: Icon(
            Icons.add,
            color: couleur.SecondaryColors,
            size: 45,
          ),
        );
      case 1:
        // Page Tâches
        return Container();
      case 2:
        // Page Calendrier
        // Pas de bouton flottant pour la page Calendrier, donc retourne un conteneur vide
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
      case 3:
        // Page Notes
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

    // Initialiser pages après la création de TaskList
    pages = [
      const TaskScreen(),
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

  // Future<void> _pickedimage() async {
  //   final picker = ImagePicker();
  //   final PickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (PickedFile != null) {
  //       _image = File(PickedFile.path);
  //     }
  //   });
  // }

  void addPic() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: couleur.SecondaryColors,
      content: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(Icons.add_a_photo_outlined),
                Text('appareil photo')
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [Icon(Icons.add_a_photo_outlined), Text('galery')],
          ))
        ],
      ),
    ));
  }

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
                child: IconButton(
                  onPressed: () {
                    addPic();
                  },
                  icon: Icon(
                    Icons.add_a_photo_outlined,
                    color: couleur.TertiaryColors,
                    size: 30,
                  ),
                )),
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
              onTap: () {
                Navigator.pushNamed(context, '/paramètre');
              },
            ),
            ListTile(
              title: Text(
                'Aide et bug',
                style: Fonts.boldSecondary,
              ),
              onTap: () {},
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const Divider(),
            ListTile(
              title: Text(
                'Invitez vos ami(e)s',
                style: Fonts.boldSecondary,
              ),
            )
          ],
        ),
      ),
      appBar: _selectedIndex == 3
          ? null
          : AppBar(
              primary: true,
              automaticallyImplyLeading: false,
              backgroundColor: _selectedIndex != 1
                  ? couleur.Screen
                  : couleur.SecondaryColors,
              actions: [
                _selectedIndex != 1
                    ? _selectedIndex != 3
                        ? IconButton(
                            onPressed: () {
                              showSearch(
                                  context: context, delegate: ListSearch());
                            },
                            icon: const Icon(Icons.search))
                        : Container()
                    : Container()
              ],
              title: _selectedIndex != 1
                  ? const SafeArea(
                      child: Row(
                      children: [
                        DrawerButton(
                          style: ButtonStyle(
                              animationDuration: Duration(milliseconds: 500),
                              iconColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 06, 79, 96))),
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
                                                indice: 1,
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
            textStyle: Fonts.regularPrimary,
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
