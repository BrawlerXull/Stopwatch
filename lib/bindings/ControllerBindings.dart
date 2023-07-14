import 'package:get/get.dart';
import 'package:stopwatch/screens/pomodoropage/controller/PomodoroPageController.dart';
import 'package:stopwatch/screens/stopwatchpage/controller/StopWatchPageController.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StopWatchPageController());
    Get.lazyPut(() => PomodoroPageController());
  }
}
