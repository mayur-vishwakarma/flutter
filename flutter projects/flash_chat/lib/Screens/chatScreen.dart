import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Screens/loginScreen.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String id = "chatScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: Center(
          child: Text(
            "Flash Chat",
            style: TextStyle(color: Colors.amber.shade900),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await firebase.signOut();
                const LoginScreen();
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.amber.shade800,
              ))
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(color: Colors.amber.shade900),
                        decoration: InputDecoration(
                          label: Text(
                            "Enter Message",
                            style: TextStyle(
                              color: Colors.amber.shade600,
                              fontSize: 20,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 3),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.amber,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
