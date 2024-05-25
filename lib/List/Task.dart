import 'package:hive/hive.dart';

class Taskdata {
  static List TaskList = [];

  //référence de la base de donnée

  final _box = Hive.box("TaskDo");

  InitData() {
    TaskList = [
      ["Make tutorial", false, false, 'lun. le 8 a 11h58min'],
      ["AZA", false, false, 'lun. le 8 a 11h58min'],
      ["azania", false, false, 'lun. le 8 a 11h58min'],
    ];
  }

  void chargementData() {
    TaskList = _box.get("Tasklist");
  }

  void modifiactionList() {
    _box.put("Tasklist", TaskList);
  }
}
