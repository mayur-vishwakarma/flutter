import 'package:flash_chat/Screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Screens/welcomeScreen.dart';
import 'package:flash_chat/Screens/registrationScreen.dart';
import 'package:flash_chat/Screens/chatScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
  await Firebase.initializeApp();
}catch(e){
  print(e);
}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
