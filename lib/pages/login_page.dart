import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //_ for private
  String name = "";
  bool changeButton = false;

  final _formKey =
      GlobalKey<FormState>(); //TFF AUTOMATICALLY ASSOCIATED WITH THIS KEY
  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
      changeButton = true;
    });
    //await Future.delayed(const Duration(seconds: 1));
    Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    //REPLACE MATERIAL BY SCAFOLD FOR APP BAR
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            //FOR VALIDATION WRAP HERE WITH FORM, TFF MUST AND NOT TF
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/undraw_enter_uhqk.png",
                  fit: BoxFit.cover,
                  height: 240,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    children: [
                      //TEXTFIELD CAN BE USED BUT TFF WILL PROVIDE VALIDATION TOO
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter username",
                          labelText: "username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username can't be empty!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty!";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // ElevatedButton(
                      //   style:
                      //       TextButton.styleFrom(minimumSize: const Size(88, 40)),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: const Text("Login"),
                      // ),
                      Material(
                        color: Colors.deepPurpleAccent,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          splashColor: Colors.grey,
                          onTap: () => moveToHome(context),
                          // async {
                          //   setState(() {
                          //     changeButton = true;
                          //   });
                          //   await Future.delayed(const Duration(seconds: 1));
                          //   await Navigator.pushNamed(context, MyRoutes.homeRoute);
                          //   setState(() {
                          //     changeButton = false;

                          //   });
                          // },
                          child: AnimatedContainer(
                            //child: Ink(
                            duration: const Duration(seconds: 1),
                            alignment: Alignment.center,
                            width: changeButton ? 50 : 150,
                            height: 50,

                            // decoration: BoxDecoration( //IF MATERIAL USED AT TOP FOR REPEL EFFECT, GIVE COLOR, BRADIUS TO IT
                            //   color: Colors.deepPurpleAccent,
                            //   //shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                            //   borderRadius:
                            //       BorderRadius.circular(changeButton ? 50 : 8),
                            // ),
                            // color: Colors.amber,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
