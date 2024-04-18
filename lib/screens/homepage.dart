import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:small_app/components/dialog_box.dart';
import 'package:small_app/components/note_task.dart';
import 'package:small_app/data/database.dart';
import 'package:small_app/style/styleapp.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  final _Controller = TextEditingController();
  NoteDataBase db = NoteDataBase();
  @override
  void initState() {
    if (_mybox.get("NOTELIST") == null) {
      db.CreateInitData();
    } else {
      db.LoadData();
    }
    super.initState();
  }

  void checkchangedbox(bool? value, int index) {
    setState(() {
      db.noteList[index][1] = !db.noteList[index][1];
    });
    db.UbdateData();
  }

  void SaveNewTask() {
    setState(() {
      if (_Controller.text != "") {
        db.noteList.add([_Controller.text, false]);
        _Controller.clear();
      }
    });
    Navigator.of(context).pop();
    db.UbdateData();
  }

  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          Controller: _Controller,
          onSave: SaveNewTask,
          Cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.noteList.removeAt(index);
    });
    db.UbdateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.mainColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Note App"),
          centerTitle: true,
          backgroundColor: AppStyle.mainColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: CreateNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.noteList.length,
            itemBuilder: (context, index) {
              return NoteTask(
                taskname: db.noteList[index][0],
                taskcompleted: db.noteList[index][1],
                onChanged: (value) => checkchangedbox(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
