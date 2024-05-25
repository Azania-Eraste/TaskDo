import "package:azaproject/List/Project.dart";
import "package:azaproject/MainScreen/pages.dart";
import "package:azaproject/Util/Colors.dart";
import "package:azaproject/Util/Fonts.dart";
import "package:azaproject/Util/ProjectStarted.dart";
import "package:azaproject/Util/ProjectToDo_tile.dart";
import "package:azaproject/Util/Search.dart";
import "package:flutter/material.dart";

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({
    super.key,
  });

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  MyColors couleur = MyColors();

  int selectedDate = 0;
  int nombreProjet = 3;
  int projetStarted = 1;
  int projetAFaire = 2;
  ScrollController scrollController = ScrollController();

  void _projet(List projectDo, List projetstarted) {
    setState(() {
      nombreProjet = projectDo.length + projetstarted.length;
      projetStarted = projetstarted.length;
      projetAFaire = projectDo.length;
    });
  }

  double offSet() {
    if (selectedDate <= 8) {
      return 40.0;
    }
    return 70.0;
  }

  bool estBissextile(int year) {
    if (year % 4 == 0) {
      if (year % 400 == 0 || year % 100 != 0) {
        return true;
      }
    }
    return false;
  }

  void scroll() {
    scrollController.animateTo(
      selectedDate * offSet(),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now().day;
    _projet(ProjectListAFaire, ProjectListStarted);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Utilisez la méthode animateTo pour centrer l'élément 50 (par exemple)
      scrollController.animateTo(
        selectedDate *
            offSet(), // 50 est l'index de l'élément que vous voulez centrer
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutSine,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime currentMonth = DateTime.now();

    List<int> monthDay = [];

    switch (currentMonth.month) {
      case DateTime.january:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.february:
        if (estBissextile(currentMonth.year)) {
          for (int i = 1; i <= 29; i++) {
            monthDay.add(i);
          }
        } else {
          for (int i = 1; i <= 28; i++) {
            monthDay.add(i);
          }
        }
        break;
      case DateTime.march:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.april:
        for (int i = 1; i <= 30; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.may:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.june:
        for (int i = 1; i <= 30; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.july:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.august:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.september:
        for (int i = 1; i <= 30; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.october:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.november:
        for (int i = 1; i <= 30; i++) {
          monthDay.add(i);
        }
        break;
      case DateTime.december:
        for (int i = 1; i <= 31; i++) {
          monthDay.add(i);
        }
        break;
    }

    String day = 'a';

    switch (currentDate.weekday) {
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

    String formattedDate =
        " $day le ${currentDate.day} à ${currentDate.hour}h${currentDate.minute}min";

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Aujourd\'hui vous avez ',
                      style: Fonts.boldSecondary,
                    ),
                    Text('$nombreProjet', style: Fonts.boldTertiary),
                    Text(' projet', style: Fonts.boldSecondary),
                  ],
                ),
              ],
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
                  controller: scrollController,
                  itemCount: monthDay.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = monthDay[index];
                        });

                        const MyPages(
                          indice: 0,
                        );
                        scroll();
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.all(15),
                        width: 50,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: monthDay[index] == selectedDate
                                ? couleur.primarycolors
                                : couleur.SecondaryColors,
                          ),
                          color: monthDay[index] == selectedDate
                              ? couleur.SecondaryColors
                              : couleur.primarycolors,
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: Center(
                          child: Text('${monthDay[index]}',
                              style: monthDay[index] == selectedDate
                                  ? Fonts.boldTertiary
                                  : Fonts.boldSecondary),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text('À faire : ', style: Fonts.boldSecondary),
                    Container(
                      width: 20,
                      decoration: BoxDecoration(
                          color: couleur.TertiaryColors,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('$projetAFaire', style: Fonts.boldPrimary),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: Search(ProjectListAFaire));
                        },
                        icon: const Icon(Icons.search))
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: ProjectListAFaire.length,
              itemBuilder: (context, index) {
                return ProjectTile(
                    Titre: ProjectListAFaire[index][0],
                    date: formattedDate,
                    sous_titre: ProjectListAFaire[index][1],
                    lieux: ProjectListAFaire[index][2]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('Commencer :', style: Fonts.boldSecondary),
                      ),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                            color: couleur.TertiaryColors,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child:
                              Text('$projetStarted', style: Fonts.boldPrimary),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: Search(ProjectListStarted));
                          },
                          icon: const Icon(Icons.search))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ProjectListStarted.length,
            itemBuilder: (context, index) {
              return ProjectStarted(
                title: ProjectListStarted[index][0],
                Date: formattedDate,
                subtitle: ProjectListStarted[index][1],
              );
            },
          )),
          const Expanded(child: SizedBox())
        ],
      ),
    ));
  }
}
