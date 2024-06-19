import 'package:azaproject/MainScreen/Tasks/TaskScreen.dart';
import 'package:hive/hive.dart';

class Taskdata {
  static List TaskList = [];
  static List TagList = [];

  // Double tag

  static bool DoubleTag(String? text) {
    text = text!.toLowerCase();
    for (var i = 0; i < TaskScreen.option.length; i++) {
      if (text.compareTo(TaskScreen.option[i].toLowerCase()) == 0) {
        return true;
      }
    }
    return false;
  }

  //référence de la base de donnée

  final _box = Hive.box("TaskDo");

  InitData() {
    if (_box.get('Tasklist') == null) {
      TaskList = [
        ["Make tutorial", false, false, 'lun. le 8 a 11h58min', 3],
        ["AZA", false, false, 'lun. le 8 a 11h58min', 3],
        ["azania", false, false, 'lun. le 8 a 11h58min', 3],
      ];
    }
    if (_box.get('TagList') == null) {
      TagList = ["Tous"];
    }
  }

  void chargementData() {
    TaskList = _box.get("Tasklist");
    TagList = _box.get("TagList");
  }

  void modifiactionList() {
    _box.put("Tasklist", TaskList);
    _box.put("TagList", TagList);
  }
}
