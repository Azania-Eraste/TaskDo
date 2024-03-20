import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/MeetingState.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

MyColors couleur = MyColors();

class Mycalendar extends StatefulWidget {
  final CalendarView? FormatCalendrier;
  Mycalendar({Key? key, this.FormatCalendrier}) : super(key: key);

  @override
  State<Mycalendar> createState() => _MycalendarState();
}

class _MycalendarState extends State<Mycalendar> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      backgroundColor: couleur.TertiaryColors,
      view: widget.FormatCalendrier!,
      initialSelectedDate: DateTime.now(),
      firstDayOfWeek: 1,
      viewHeaderHeight: -1,
      todayHighlightColor: couleur.SecondaryColors,
      dataSource: MeetingDataSource(getAppointents()),
    );
  }
}

List<Appointment> getAppointents() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  final endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Aza',
      color: couleur.SecondaryColors,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: true));
  return meetings;
}
