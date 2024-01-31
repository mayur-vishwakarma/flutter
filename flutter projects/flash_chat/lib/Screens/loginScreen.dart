import 'package:flash_chat/components/ele_button.dart';
import 'package:flash_chat/constant.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Screens/chatScreen.dart';
//import 'package:flash_chat/Screens/RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

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
                    tag: 'logo',
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter Login Details",
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
                  Buttons(
                    buttonName: "Login",
                    onpress: () {
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
