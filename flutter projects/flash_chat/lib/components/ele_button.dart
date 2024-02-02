import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.buttonName, required this.onpress});
  final String buttonName;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        overlayColor: MaterialStateProperty.all(Colors.orange[200]),
        backgroundColor: MaterialStateProperty.all(
          Colors.amber[200],
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.amber[900],
        ),
      ),
      onPressed: () {
        onpress();
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
