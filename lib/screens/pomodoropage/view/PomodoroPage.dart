import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stopwatch/screens/pomodoropage/controller/PomodoroPageController.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  final CountDownController _controller = CountDownController();
  final PomodoroPageController controller = PomodoroPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1116),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Pomodoro",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80,
              ),
              Obx(
                () => CircularCountDownTimer(
                  autoStart: false,
                  controller: _controller,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  duration: controller.valueTimer.value,
                  isTimerTextShown: true,
                  isReverseAnimation: false,
                  isReverse: true,
                  textStyle: const TextStyle(
                      fontSize: 70.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  fillColor: Colors.red,
                  ringColor: Colors.blue,
                  onComplete: () {
                    Timer(Duration(seconds: controller.valueBreak.value), () {
                      _controller.restart(
                          duration: controller.valueTimer.value);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Timer Seconds",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => NumberPicker(
                        minValue: 1,
                        maxValue: 60,
                        value: controller.valueTimer.value,
                        onChanged: (value) {
                          controller.change_timer_value(value);
                        },
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Break Timer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => NumberPicker(
                      minValue: 1,
                      maxValue: 60,
                      value: controller.valueBreak.value,
                      onChanged: (value) {
                        controller.change_break_value(value);
                      },
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {
                  _controller.restart(duration: controller.valueTimer.value);
                },
                child: const Text("Set!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
