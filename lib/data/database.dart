import 'package:hive_flutter/hive_flutter.dart';

class NoteDataBase {
  List noteList = [];
  final _mybox = Hive.box('mybox');

  void CreateInitData() {
    noteList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  void LoadData() {
    noteList = _mybox.get("NOTELIST");
  }

  void UbdateData() {
    _mybox.put("NOTELIST", noteList);
  }
}
