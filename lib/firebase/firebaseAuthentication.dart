import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  static Future<void> signupWithEmailAndPassword(String emailAddress,
      String password, BuildContext context, Widget screen) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Succefuly"),
        backgroundColor: Colors.blue,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The password provided is too weak.'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The account already exists for that email.'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
        backgroundColor: Colors.red,
      ));
    }
  }

  static Future<void> signinWithEmailAndPassword(String emailAddress,
      String password, BuildContext context, Widget screen) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Succefuly"),
        backgroundColor: Colors.blue,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No user found for that email.'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wrong password provided for that user.'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

 static Future<void> changePassword(String emailAddress , BuildContext context,) async {
    try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Succefuly"),
        backgroundColor: Colors.blue,
      ));

    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The password provided is too weak.'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
        backgroundColor: Colors.red,
      ));
    }

  }
}
