import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:small_app/firebase/firebaseAuthentication.dart';
import 'package:small_app/screens/login.dart';
import 'package:small_app/widgets/custom_scaffold.dart';

final formkey = GlobalKey<FormState>();

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Form(
      key: formkey,
      child: Column(
        children: [
          const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              )),
          Expanded(
            flex: 9,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 113, 206),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: TextFormField(
                      controller: EmailController,
                      validator: (value) {
                        if (value!.length < 9 || !value.contains('@')) {
                          return "Enter a Valid Email";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Email address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: PasswordController,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Enter at least 6 characters for the password.";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          FirebaseAuthentication.signupWithEmailAndPassword(
                              EmailController.text,
                              PasswordController.text,
                              context,
                              LoginPage());
                        }
                      },
                      child: Text(
                        "SignUp",
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
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Text("Login With"),
                      Expanded(
                        child: Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Logo(Logos.facebook_f),
                      Logo(Logos.google),
                      Logo(Logos.twitter),
                      Logo(Logos.apple),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an Acount ?'),
                      const SizedBox(
                        width: 10,
                      ),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
