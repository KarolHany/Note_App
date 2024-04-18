import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.buttonName , required this.onPressed});
  final String buttonName;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Text(buttonName),
        color: Theme.of(context).primaryColor,
    );
  }
}
