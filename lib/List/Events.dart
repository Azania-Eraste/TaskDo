import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingData {
  //référence de la base de donnée
  static List<Appointment> meeting = [];

  initData() {
    meeting = [
      Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 2)))
    ];
  }

  static List<Appointment> getAppointents() {
    return meeting;
  }

}
