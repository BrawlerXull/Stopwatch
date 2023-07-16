import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:stopwatch/screens/stopwatchpage/controller/StopWatchPageController.dart';
import 'package:stopwatch/utils/Utils.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => Text(
                  "${Get.find<StopWatchPageController>().hourDigit.toString()}: ${Get.find<StopWatchPageController>().minuteDigit.toString()}: ${Get.find<StopWatchPageController>().secondDigit.toString()}",
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
                        itemCount:
                            Get.find<StopWatchPageController>().laps.length,
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
                                Get.find<StopWatchPageController>().laps[index],
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
                      Get.find<StopWatchPageController>().start();
                      print(Get.find<StopWatchPageController>()
                          .secondDigit
                          .value);
                    },
                    child: Obx(() => Text(
                          Get.find<StopWatchPageController>().isStarted.value
                              ? "Pause"
                              : "Start",
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
                          "${Get.find<StopWatchPageController>().hourDigit.toString()}: ${Get.find<StopWatchPageController>().minuteDigit.toString()}: ${Get.find<StopWatchPageController>().secondDigit.toString()}";
                      Get.find<StopWatchPageController>().addLaps(lap);
                      print(Get.find<StopWatchPageController>().laps);
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Get.find<StopWatchPageController>().reset();
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
