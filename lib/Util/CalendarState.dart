import 'package:azaproject/List/Events.dart';
import 'package:azaproject/MainScreen/pages.dart';

import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Fonts.dart';
import 'package:azaproject/Util/MeetingState.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

MyColors couleur = MyColors();

class Mycalendar extends StatefulWidget {
  //Reference de la base de donnée

  const Mycalendar({
    super.key,
  });

  @override
  State<Mycalendar> createState() => _MycalendarState();
}

class _MycalendarState extends State<Mycalendar> {
  CalendarView format(String formatedate) {
    switch (formatedate) {
      case "Journalier":
        return CalendarView.day;

      case "Hebdomadaire(Timeline)":
        return CalendarView.timelineWeek;

      case "Hebdomadaire":
        return CalendarView.week;

      case "Mensuel":
        return CalendarView.month;
      case "Journalier(Timeline)":
        return CalendarView.timelineDay;
    }

    return CalendarView.month;
  }

  CalendarView view = CalendarView.month;

  @override
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      backgroundColor: couleur.Screen,
      // ignore: unnecessary_null_comparison
      view: format(MyPages.formatSelected),
      initialSelectedDate: DateTime.now(),
      onViewChanged: (viewChangedDetails) => const MyPages(
        indice: 1,
      ),
      blackoutDatesTextStyle: Fonts.boldBlack,
      firstDayOfWeek: 1,
      onTap: (calendarTapDetails) {},
      viewHeaderHeight: -1, showTodayButton: true,
      todayTextStyle: Fonts.boldPrimary,
      todayHighlightColor: couleur.SecondaryColors,
      dataSource: MeetingDataSource(MeetingData.getAppointents()),
    );
  }
}
