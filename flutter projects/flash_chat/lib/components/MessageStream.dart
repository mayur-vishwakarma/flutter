import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/messageBubble.dart';

final firestore = FirebaseFirestore.instance;

class MessageStream extends StatelessWidget {
  const MessageStream({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection("message").snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final mes = snapshot.data!.docs.reversed;
          List<Widget> messageLists = [];
          for (var mess in mes) {
            final Map<String, dynamic>? messageData =
                mess.data() as Map<String, dynamic>?;

            if (messageData != null) {
              final messageText = messageData['text'];
              final messageSender = messageData['sender'];

              if (messageText != null && messageSender != null) {
                final messageList = MessageBubble(
                  messageText: messageText,
                  messageSender: messageSender,
                  isMe: email == messageSender,
                );
                messageLists.add(messageList);
              }
            }
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              children: messageLists,
            ),
          );
          // return Column(
          //   children: messageLists,
          // );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
