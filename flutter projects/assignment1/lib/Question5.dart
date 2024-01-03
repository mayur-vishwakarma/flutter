import 'package:flutter/material.dart';

class Question5 extends StatefulWidget {
  const Question5({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Question5();
  }
}

class _Question5 extends State<Question5> {
  Color color1 = Colors.white;
  Color color2 = Colors.red;
  int i = 0;
  int k = 0;
  int j = 0;

  @override
  Widget build(BuildContext context) {
    Color color4 = color1;
    Color color5 = color1;
    Color color6 = color1;

    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (i == 0) {
                      color4 = color2;
                      i = 1;
                    } else {
                      color4 = color1;
                      i = 0;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: color4, border: Border.all(color: Colors.black)),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (j == 0) {
                      color5 = color2;
                      j = 1;
                    } else {
                      color5 = color1;
                      j = 0;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: color5, border: Border.all(color: Colors.black)),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (k == 0) {
                      color6 = color2;
                      k = 1;
                    } else {
                      color6 = color1;
                      k = 0;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: color6, border: Border.all(color: Colors.black)),
                ),
              ),
            ],
          ),
        ));
  }
}
