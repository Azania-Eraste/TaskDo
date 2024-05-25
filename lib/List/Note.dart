//Initialiser la liste des notes
import 'package:hive/hive.dart';

class NoteData {
  //référence de la base de donnée

  final _box = Hive.box("TaskDo");

  static List NoteList = [];

  initData() {
    NoteList = [
      ["One day or day one", "aza", "lun. le 8 à 11h58min"],
      ["Azania", "azania", "lun. le 8 à 11h58min"]
    ];
  }

  void chargementData() {
    NoteList = _box.get("NoteList");
  }

  void modifiactionList() {
    _box.put("NoteList", NoteList);
  }
}
