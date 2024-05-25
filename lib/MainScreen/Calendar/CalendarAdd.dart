import 'package:azaproject/List/Events.dart';
import 'package:azaproject/MainScreen/pages.dart';
import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/TextField.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarAdd extends StatefulWidget {
  const CalendarAdd({super.key});

  @override
  State<CalendarAdd> createState() => _CalendarAddState();
}

class _CalendarAddState extends State<CalendarAdd> {
  TextEditingController nomEvent = TextEditingController();
  TextEditingController DescripEevnt = TextEditingController();
  List<Appointment> meetings = MeetingData.getAppointents();
  late bool ValueDay;
  late bool ValueRappel;
  DateTime selectedDateEnd = DateTime.now().add(const Duration(hours: 1));
  DateTime selectedDateStart = DateTime.now();
  MeetingData _dbMeeting = MeetingData();
  @override
  void initState() {
    super.initState();

    ValueDay = false;
    ValueRappel = false;
  }

  bool checkDay() {
    setState(() {
      ValueDay = !ValueDay;
    });
    return ValueDay;
  }

  bool checkAlarm() {
    setState(() {
      ValueRappel = !ValueRappel;
    });
    return ValueRappel;
  }

  Future<DateTime?> DateTimePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateStart ?? DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime.now().add(const Duration(days: 1000)),
      cancelText: 'Annuler',
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }

    return null;
  }

  static const RepeterItems = <String>[
    'Evenement unique',
    'Quotidient',
    'Hebdomadaire',
    'Mensuel',
    'Annuel',
    'Personnalisé'
  ];
  static const RappelItems = <String>[
    'Lorsque l\'évènement commence'
        '5 minutes avant que l\'évènement commence',
    '10 minutes avant que l\'évènement commence ',
    '15 minutes avant que l\'évènement commence',
    '30 minutes avant que l\'évènement commence',
    'Personnalisé'
  ];

  final List<PopupMenuItem<String>> _popupMenuItems =
      RepeterItems.map((String text) => PopupMenuItem(
            value: text,
            child: Text(text),
          )).toList();
  final List<PopupMenuItem<String>> _popupMenuRappelItems =
      RappelItems.map((String text) => PopupMenuItem(
            value: text,
            child: Text(text),
          )).toList();
  String btnSelected = 'Evenement unique';
  String rappelSelected = 'Lorsque l\'évènement commence';
  @override
  Widget build(BuildContext context) {
    String DayStart = 'a';
    switch (selectedDateStart.weekday) {
      case 1:
        DayStart = 'Lun.';
        break;
      case 2:
        DayStart = 'Mar.';
        break;
      case 3:
        DayStart = 'Mer.';
        break;
      case 4:
        DayStart = 'Jeu.';
        break;
      case 5:
        DayStart = 'Ven.';
        break;
      case 6:
        DayStart = 'Sam.';
        break;
      case 7:
        DayStart = 'Dim.';
        break;
    }
    String formattedDateStart =
        "$DayStart le ${selectedDateStart.day} à ${selectedDateStart.hour}h${selectedDateStart.minute}min";
    String DayEnd = 'a';
    switch (selectedDateEnd.weekday) {
      case 1:
        DayEnd = 'Lun.';
        break;
      case 2:
        DayEnd = 'Mar.';
        break;
      case 3:
        DayEnd = 'Mer.';
        break;
      case 4:
        DayEnd = 'Jeu.';
        break;
      case 5:
        DayEnd = 'Ven.';
        break;
      case 6:
        DayEnd = 'Sam.';
        break;
      case 7:
        DayEnd = 'Dim.';
        break;
    }
    String formattedDateEnd =
        "$DayEnd le ${selectedDateEnd.day} à ${selectedDateEnd.hour}h${selectedDateEnd.minute}min";

    return Scaffold(
      backgroundColor: couleur.Screen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Center(
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
                      Text('Ajouter un\névénement',
                          style: Fonts.boldSecondaryBig)
                    ],
                  ),
                ),
                MyTextField(
                  style: Fonts.boldBlack,
                  PasswordChar: false,
                  controller: nomEvent,
                  fillcolor: Colors.transparent,
                  Radius: 20,
                  HintStyle: Fonts.regularHint,
                  text: 'Nom de l\'evenement',
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 8),
                    child: SwitchListTile.adaptive(
                        title: Text('Toute la journée ',
                            style: Fonts.boldSecondary),
                        value: ValueDay,
                        onChanged: (value) => checkDay())),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Row(
                    children: [
                      Text(
                        'De',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'DMSans',
                            color: couleur.SecondaryColors),
                      ),
                      IconButton(
                          onPressed: () async {
                            final DateTime? selectedDate =
                                await DateTimePicker();
                            if (selectedDate != null) {
                              setState(() {
                                selectedDateStart = selectedDate;
                                if (selectedDateStart
                                    .isAfter(selectedDateEnd)) {
                                  selectedDateEnd = selectedDateStart
                                      .add(const Duration(hours: 1));
                                }
                              });
                              print(
                                  'Date de début sélectionnée: $selectedDate');
                            }
                          },
                          icon: Icon(Icons.calendar_month,
                              color: couleur.SecondaryColors)),
                      Text(
                        formattedDateStart,
                        style: TextStyle(
                            color: couleur.SecondaryColors, fontSize: 15),
                      )
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
                            fontFamily: 'DMSans',
                            color: couleur.SecondaryColors),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: IconButton(
                              onPressed: () async {
                                final DateTime? selectedDate =
                                    await DateTimePicker();
                                if (selectedDate != null) {
                                  setState(() {
                                    selectedDateEnd = selectedDate;
                                    if (selectedDateEnd
                                        .isBefore(selectedDateStart)) {
                                      selectedDateStart = selectedDateEnd
                                          .subtract(const Duration(hours: 1));
                                    }
                                  });
                                  print(
                                      'Date de fin sélectionnée: $selectedDate');
                                }
                              },
                              icon: Icon(Icons.calendar_month,
                                  color: couleur.SecondaryColors))),
                      Text(
                        formattedDateEnd,
                        style: TextStyle(
                            color: couleur.SecondaryColors, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: ListTile(
                      title: Text('Répéter', style: Fonts.boldSecondary),
                      trailing: PopupMenuButton<String>(
                          color: couleur.SecondaryColors,
                          onSelected: (String newValue) {
                            btnSelected = newValue;
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(btnSelected)));
                            setState(() {});
                          },
                          itemBuilder: (BuildContext context) =>
                              _popupMenuItems),
                      subtitle: Text(
                        btnSelected,
                        style: Fonts.regularSecondarySmall,
                      ),
                    )),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: ListTile(
                      title: Text('Rappel', style: Fonts.boldSecondary),
                      trailing: PopupMenuButton<String>(
                          color: couleur.SecondaryColors,
                          onSelected: (String newValue) {
                            rappelSelected = newValue;
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(rappelSelected)));
                            setState(() {});
                          },
                          itemBuilder: (BuildContext context) =>
                              _popupMenuRappelItems),
                      subtitle: Text(
                        rappelSelected,
                        style: Fonts.regularSecondarySmall,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SwitchListTile.adaptive(
                      title:
                          Text('Alarme de rappel ', style: Fonts.boldSecondary),
                      value: ValueRappel,
                      onChanged: (value) => checkAlarm()),
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 15),
                  child: ListTile(
                    onTap: () {},
                    title: Text('Localisation', style: Fonts.boldSecondary),
                    trailing: const Icon(Icons.map),
                  ),
                ),
                MyTextField(
                  style: Fonts.boldBlack,
                  controller: DescripEevnt,
                  Radius: 20,
                  HintStyle: Fonts.regularHint,
                  text: 'Description',
                  PasswordChar: false,
                  fillcolor: couleur.primarycolors,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: couleur.SecondaryColors,
        elevation: 10,
        onPressed: () {
          meetings.add(Appointment(
            startTime: selectedDateStart,
            endTime: selectedDateEnd,
            isAllDay: ValueDay,
            subject: nomEvent.text,
            notes: DescripEevnt.text,
          ));
          _dbMeeting.modifiactionList();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyPages(
                        indice: 2,
                      )));
        },
        child: Icon(
          Icons.save,
          color: couleur.TertiaryColors,
        ),
      ),
    );
  }
}
