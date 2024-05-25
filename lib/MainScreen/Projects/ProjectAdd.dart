import "package:azaproject/List/Project.dart";

import "package:azaproject/Service/User.dart";
import "package:azaproject/Util/CalendarState.dart";
import "package:azaproject/Util/Dialog_Box.dart";
import "package:azaproject/Util/Fonts.dart";
import "package:flutter/material.dart";

class ProjectAdd extends StatefulWidget {
  const ProjectAdd({super.key});

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  TextEditingController titreControlleur = TextEditingController();
  TextEditingController contenucontrolleur = TextEditingController();
  TextEditingController controller = TextEditingController();

  void saveNewTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        ProjectTask.add([
          [controller.text, false, false]
        ]);
      });
    }
    controller.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ProjectAdd()));
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return BoiteDialogue(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 50,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: couleur.SecondaryColors,
            )),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Text('Créer', style: Fonts.boldSecondaryMid),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: TextField(
                  style: Fonts.boldBlack,
                  decoration: InputDecoration(
                    hintText: 'Titre',
                    hintStyle: Fonts.boldSecondaryMid,
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
                      hintStyle: Fonts.boldSecondary),
                  style: Fonts.boldBlack,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Text('Membre : ', style: Fonts.boldSecondary),
                  ],
                ),
                trailing: const Icon(Icons.add),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
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
                      child: Text(
                        User.name,
                        style: Fonts.regularBlackMId,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        title: Text('Lieu', style: Fonts.boldSecondary),
                        trailing: const Icon(Icons.map),
                        onTap: () {},
                      )),
                  Text(
                    '(Aucun lieu)',
                    style: Fonts.regularHintMid,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        title: Text('Tâches', style: Fonts.boldSecondary),
                        trailing: const Icon(Icons.task),
                        onTap: () {
                          createNewTask();
                        },
                      )),
                  Text(
                    '(Aucune tâche)',
                    style: Fonts.regularHintMid,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: couleur.TertiaryColors,
        onPressed: () {},
        child: Icon(
          Icons.save_alt,
          color: couleur.SecondaryColors,
          size: 40,
        ),
      ),
    );
  }
}
