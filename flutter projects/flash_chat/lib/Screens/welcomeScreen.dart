import 'package:flutter/material.dart';
import 'package:flash_chat/Screens/loginScreen.dart';
import 'package:flash_chat/Screens/registrationScreen.dart';
import 'package:flash_chat/components/ele_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String id = "welcomeScreen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.white,
      end: Colors.amber[50],
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.amber,
                      fontWeight: FontWeight.w800,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Flash Chat",
                          speed: const Duration(milliseconds: 300),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Buttons(
                buttonName: "Login",
                onpress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            const SizedBox(
              height: 20,
            ),
            Buttons(
                buttonName: "Register",
                onpress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
