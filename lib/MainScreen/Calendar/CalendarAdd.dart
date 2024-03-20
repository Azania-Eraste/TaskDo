import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';

class CalendarAdd extends StatefulWidget {
  const CalendarAdd({super.key});

  @override
  State<CalendarAdd> createState() => _CalendarAddState();
}

class _CalendarAddState extends State<CalendarAdd> {
  TextEditingController NomEvent = new TextEditingController();
  bool Value = false;
  void checkDay(bool value) {
    setState(() {
      Value = !Value;
    });
  }

  void DateTimePicker() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: DatePickerDialog(
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 1000)),
            ),
          );
        });
  }

  static const RepeterItems = <String>[
    'Evenement unique',
    'Quotidient',
    'Hebdomadaire',
    'Mensuel',
    'Annuel',
    'Personnalisé'
  ];

  final List<PopupMenuItem<String>> _popupMenuItems =
      RepeterItems.map((String text) => PopupMenuItem(
            child: Text(text),
            value: text,
          )).toList();
  String btnSelected = 'Evenement unique';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleur.Screen,
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 20),
              child: Row(
                children: [
                  Text(
                    'Ajouter un\névénement',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: couleur.SecondaryColors),
                  )
                ],
              ),
            ),
            MyTextField(
              PasswordChar: false,
              controller: NomEvent,
              fillcolor: Colors.transparent,
              Radius: 40,
              text: 'Nom de l\'evenement',
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8),
                child: SwitchListTile.adaptive(
                    title: Text(
                      'Toute la journée ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: couleur.SecondaryColors),
                    ),
                    value: Value,
                    onChanged: (value) => checkDay(value))),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Row(
                children: [
                  Text(
                    'De',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Value
                            ? Colors.grey.shade400
                            : couleur.SecondaryColors),
                  ),
                  IconButton(
                      onPressed: Value ? null : DateTimePicker,
                      icon: Icon(Icons.calendar_month,
                          color: Value
                              ? Colors.grey.shade400
                              : couleur.SecondaryColors))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Row(
                children: [
                  Text(
                    'À',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Value
                            ? Colors.grey.shade400
                            : couleur.SecondaryColors),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: IconButton(
                        onPressed: Value ? null : DateTimePicker,
                        icon: Icon(Icons.calendar_month,
                            color: Value
                                ? Colors.grey.shade400
                                : couleur.SecondaryColors)),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: ListTile(
                  title: Text(
                    'Répéter',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: couleur.SecondaryColors),
                  ),
                  trailing: PopupMenuButton<String>(
                      color: couleur.SecondaryColors,
                      onSelected: (String newValue) {
                        btnSelected = newValue;
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(btnSelected)));
                        setState(() {});
                      },
                      itemBuilder: (BuildContext context) => _popupMenuItems),
                  subtitle: Text(btnSelected),
                )),
            Divider(),
          ],
        ),
      ),
    );
  }
}
