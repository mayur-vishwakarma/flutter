import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Screens/loginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection("message").snapshots(),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      final mes = snapshot.data!.docs;
                      List<Widget> messageLists = [];
                      for (var mess in mes) {
                        final Map<String, dynamic>? messageData =
                            mess.data() as Map<String, dynamic>?;

                        if (messageData != null) {
                          final messageText = messageData['text'];
                          final messageSender = messageData['sender'];

                          if (messageText != null && messageSender != null) {
                            final messageList =
                                Text("$messageText from $messageSender");
                            messageLists.add(messageList);
                          }
                        }
                      }
                      
                      return Column(
                        children: messageLists,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
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
                          firestore.collection("message").add(
                                ({
                                  'sender': email,
                                  'text': message,
                                }),
                              );
                          setState(() {
                            message = "";
                          });
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
