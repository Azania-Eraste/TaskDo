import 'package:azaproject/Util/CalendarState.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  final String? formatedate;
  CalendarScreen({
    Key? key,
    this.formatedate,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarView FormatCalendrier;

  CalendarView Format(String? formatedate) {
    switch (widget.formatedate) {
      case "Journalier":
        print('${widget.formatedate}');
        FormatCalendrier = CalendarView.day;
        print('${widget.formatedate}');
        return FormatCalendrier;

      case "Hebdomadaire(Timeline)":
        print('${widget.formatedate}');
        FormatCalendrier = CalendarView.timelineWeek;
        print('${widget.formatedate}');
        return FormatCalendrier;

      case "Hebdomadaire":
        print('${widget.formatedate}');
        FormatCalendrier = CalendarView.week;
        print('${widget.formatedate}');
        return FormatCalendrier;

      case "Mensuel":
        print('${widget.formatedate}');
        FormatCalendrier = CalendarView.month;
        print('${widget.formatedate}');
        return FormatCalendrier;
      case "Journalier(Timeline)":
        print('${widget.formatedate}');
        FormatCalendrier = CalendarView.timelineDay;
        print('${widget.formatedate}');
        return FormatCalendrier;
    }

    return CalendarView.month;
  }

  @override
  Widget build(BuildContext context) {
    return Mycalendar(
      FormatCalendrier: Format(widget.formatedate),
    );
  }
}
