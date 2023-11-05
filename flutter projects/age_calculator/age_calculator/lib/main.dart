import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int d = 0, m = 0, y = 0;
  String days1 = "", month1 = "", year1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Age Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  f1();
                },
                child: const Text("Select Date of Birth")),
            const SizedBox(
              height: 50,
            ),
            const Text("you are - ",
                style: TextStyle(
                  fontSize: 25,
                )),
            Text("$year1  -  $month1  -  $days1",
                style: const TextStyle(
                  fontSize: 25,
                ))
          ],
        ));
  }

  Future f1() async {
    DateTime? date1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now());
    setState(() {
      d = int.parse(DateFormat("dd").format(date1!));
      m = int.parse(DateFormat("mm").format(date1));
      y = int.parse(DateFormat("yy").format(date1));

      int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
      int m1 = int.parse(DateFormat("mm").format(DateTime.now()));
      int y1 = int.parse(DateFormat("yy").format(DateTime.now()));
      int day = finddays(m1, y1);

      if ((d1 - d) >= 0) {
        days1 = (d1 - d).toString() + "days";
      } else {
        days1 = (d1 + day - d).toString() + "days";
        m1 = m1 - 1;
      }

      if ((m1 - m) >= 0) {
        month1 = (m1 - m).toString() + "days";
      } else {
        month1 = (m1 + 12 - m).toString() + "days";
        y1 = y1 - 1;
      }
      year1 = (y1 - y).toString() + "years";
    });
  }

  int finddays(int m2, int y2) {
    int day2;
    if (m2 == 1 ||
        m2 == 3 ||
        m2 == 5 ||
        m2 == 7 ||
        m2 == 8 ||
        m2 == 10 ||
        m2 == 12) {
      day2 = 31;
    } else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11) {
      day2 = 30;
    } else {
      if (y % 4 == 0) {
        day2 = 29;
      } else {
        day2 = 28;
      }
    }
    return day2;
  }
}
