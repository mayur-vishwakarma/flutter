import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/Screens/chatScreen.dart';
import 'package:flash_chat/components/ele_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constant.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static String id = "registrationScreen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name = '';
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    if (Firebase.apps.isEmpty) {
      Firebase.initializeApp();
    }
  }

  void register() async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "logo",
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter Details",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber.shade900),
                    decoration: kTextFieldInputDecoration.copyWith(
                      label: const Text(
                        "Enter Name",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber.shade900),
                    decoration: kTextFieldInputDecoration.copyWith(
                      label: const Text(
                        "Enter Email",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber.shade900),
                    obscureText: true,
                    decoration: kTextFieldInputDecoration.copyWith(
                      label: const Text(
                        "Enter Password",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Buttons(
                    buttonName: "Register",
                    onpress: () {
                      register();
                      Navigator.pushNamed(context, ChatScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
