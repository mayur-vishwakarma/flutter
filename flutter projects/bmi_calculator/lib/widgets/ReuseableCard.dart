import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard(
      {Key? key, required this.cardChild, required this.colour, })
      : super(key: key);

  final Color colour;
  final Widget cardChild;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: colour),
        child: cardChild,
      
    );
  }
}
