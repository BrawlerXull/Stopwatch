import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:stopwatch/screens/stopwatchpage/controller/HomePageController.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _HomePageState();
}

class _HomePageState extends State<StopWatchPage> {
  final HomepageController controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1116),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => Text(
                  "${controller.hourDigit.toString()}: ${controller.minuteDigit.toString()}: ${controller.secondDigit.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                  ),
                ),
              ),
              Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF252526),
                  ),
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.laps.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Lap : ${index + 1}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                controller.laps[index],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          );
                        }),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      controller.start();
                      print(controller.secondDigit.value);
                    },
                    child: Obx(() => Text(
                          controller.isStarted.value ? "Pause" : "Start",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        )),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.flag,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      String lap =
                          "${controller.hourDigit.toString()}: ${controller.minuteDigit.toString()}: ${controller.secondDigit.toString()}";
                      controller.addLaps(lap);
                      print(controller.laps);
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      controller.reset();
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
