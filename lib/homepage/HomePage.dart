import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int secondDigit = 0;
  int minuteDigit = 0;
  int hourDigit = 0;
  bool isStarted = false;
  Timer? _timer;

  List<String> laps = [];

  void Start() {
    setState(() {
      isStarted = !isStarted;
    });
    isStarted
        ? _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            setState(() {
              secondDigit++;
              secondDigit > 59 ? {minuteDigit++, secondDigit = 0} : null;
              minuteDigit > 59 ? {hourDigit++, minuteDigit = 0} : null;
            });
          })
        : _timer?.cancel();
  }

  void AddLaps(String lap) {
    setState(() {
      laps.add(lap);
    });
  }

  void Reset() {
    _timer?.cancel();
    setState(() {
      secondDigit = 0;
      minuteDigit = 0;
      hourDigit = 0;
      isStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E1116),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$hourDigit:$minuteDigit:$secondDigit",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                ),
              ),
              Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF252526),
                ),
                child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Lap : ${index + 1}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            laps[index],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Start();
                      print(secondDigit);
                    },
                    child: Text(
                      isStarted ? "Pause" : "Start",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.flag,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      String lap = "$hourDigit:$minuteDigit:$secondDigit";
                      laps.add(lap);
                      print(laps);
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Reset();
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
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
