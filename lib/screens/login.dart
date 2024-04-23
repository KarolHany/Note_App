import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:small_app/firebase/firebaseAuthentication.dart';
import 'package:small_app/screens/forgetpassword.dart';
import 'package:small_app/screens/homepage.dart';
import 'package:small_app/screens/signup.dart';
import 'package:small_app/widgets/custom_scaffold.dart';

final FormKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Form(
      key: FormKey,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text(
                        "Login",
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
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: PasswordController,
                        onChanged: (value) {},
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text('Forget Password?'),
                        const SizedBox(
                          width: 10,
                        ),
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ForgetPasswordPage()));
                            },
                            child: const Text(
                              'Forget Password',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          if (FormKey.currentState!.validate()) {
                            FirebaseAuthentication.signinWithEmailAndPassword(
                                EmailController.text,
                                PasswordController.text,
                                context,
                                HomePage());
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 0, 113, 206),
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
                        Text("SignUp With"),
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
                        const Text('Dont have an Acount ?'),
                        const SizedBox(
                          width: 10,
                        ),
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: const Text(
                              'SignUp',
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
          ),
        ],
      ),
    ));
  }
}
