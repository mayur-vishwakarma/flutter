import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Screens/loginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/MessageStream.dart';

final firebase = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String message = '';
  String? email = '';
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      email = firebase.currentUser!.email;
    } catch (e) {
      print(e);
    }
  }

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
              onPressed: () {
                firebase.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
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
              MessageStream(email: email!),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: messageTextController,
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
                        onChanged: (value) {
                          message = value;
                        },
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
                        onPressed: () {
                          messageTextController.clear();
                          firestore.collection("message").add(
                                ({
                                  'sender': email,
                                  'text': message,
                                }),
                              );
                        },
                        icon: const Icon(
                          Icons.send_outlined,
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
