import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:small_app/firebase/firebaseAuthentication.dart';
import 'package:small_app/widgets/custom_scaffold.dart';

final Formkey = GlobalKey<FormState>();

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Form(
      key: Formkey,
      child: Column(
        children: [
          const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              )),
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      "Forget Password",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.length < 9 || !value.contains('@')) {
                            return "Enter a Valid Email";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            hintText: "Enter your gmail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (Formkey.currentState!.validate()) {
                          FirebaseAuthentication.changePassword(
                              emailController.text.trim(), context);
                        }
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          backgroundColor: const Color.fromARGB(255, 0, 113, 206),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
