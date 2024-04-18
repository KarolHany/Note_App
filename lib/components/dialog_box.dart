import 'package:flutter/material.dart';
import 'package:small_app/components/buttons.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.Controller , required this.onSave , required this.Cancel});
  final Controller;
  VoidCallback onSave;
  VoidCallback Cancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content: Container(
        height: 200,
        child: Column(
          children: [
            Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: Controller,
              decoration: InputDecoration(
                hintText: "add new task",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  buttonName: "Save",
                  onPressed: onSave,
                ),
                Button(buttonName: "Cancel", onPressed:Cancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
