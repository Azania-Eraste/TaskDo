import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:flutter/material.dart';

class parametre extends StatefulWidget {
  const parametre({super.key});

  @override
  State<parametre> createState() => _parametreState();
}

class _parametreState extends State<parametre> {
  late bool darkMode;

  @override
  void initState() {
    super.initState();

    darkMode = false;
  }

  bool DarkMode() {
    setState(() {
      darkMode = !darkMode;
      print(darkMode);
    });
    return darkMode;
  }

  void policePlus() {
    setState(() {
      Fonts.boldSMallpolice += 5;
    });
    print(Fonts.boldSMallpolice);
  }

  void policeMoin() {
    setState(() {
      Fonts.boldSMallpolice -= 5;
    });
    print(Fonts.boldSMallpolice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: couleur.Screen,
        appBar: AppBar(
          leading: IconButton(
            color: const Color.fromARGB(255, 06, 79, 96),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          backgroundColor: couleur.Screen,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Paramètre',
            style: Fonts.boldSecondary,
          ),
        ),
        body: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 40, 0.8, 8.0),
                child: SwitchListTile.adaptive(
                    title: Text(
                      "Mode sombre",
                      style: Fonts.regularSecondaryMid,
                    ),
                    value: darkMode,
                    onChanged: (value) => DarkMode()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'Police des titres',
                    style: Fonts.regularSecondaryMid,
                  ),
                  trailing: Icon(Icons.add),
                  onTap: policePlus,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'Police des titres',
                    style: Fonts.regularSecondaryMid,
                  ),
                  trailing: Icon(Icons.remove),
                  onTap: policeMoin,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'Police secondaires',
                    style: Fonts.regularSecondaryMid,
                  ),
                  trailing: Icon(Icons.add),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'Police secondaires',
                    style: Fonts.regularSecondaryMid,
                  ),
                  trailing: Icon(Icons.remove),
                  onTap: () {},
                ),
              )
            ],
          ),
        ));
  }
}
