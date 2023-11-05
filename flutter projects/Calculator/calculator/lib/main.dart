import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: "Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  bool shouldReset = false;

  buttonPressed(String buttonText) {
    if (shouldReset) {
      _output = "0";
      shouldReset = false;
    }

    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      if (operand.isNotEmpty) {
        num2 = double.parse(_output);
        switch (operand) {
          case "+":
            _output = (num1 + num2).toString();
            break;
          case "-":
            _output = (num1 - num2).toString();
            break;
          case "x":
            _output = (num1 * num2).toString();
            break;
          case "/":
            if (num2 != 0) {
              _output = (num1 / num2).toString();
            } else {
              _output = "Error"; // Handle division by zero
            }
            break;
        }
        shouldReset = true;
      }
      num1 = double.parse(_output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        // Already contains a Decimal
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      if (operand.isNotEmpty) {
        num2 = double.parse(_output);
        switch (operand) {
          case "+":
            _output = (num1 + num2).toString();
            break;
          case "-":
            _output = (num1 - num2).toString();
            break;
          case "x":
            _output = (num1 * num2).toString();
            break;
          case "/":
            if (num2 != 0) {
              _output = (num1 / num2).toString();
            } else {
              _output = "Error"; // Handle division by zero
            }
            break;
        }
        shouldReset = true;
      }
    } else {
      if (_output == "0" || shouldReset) {
        _output = buttonText;
        shouldReset = false;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(output,
                style: const TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.bold)),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
