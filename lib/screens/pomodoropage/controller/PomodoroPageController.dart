import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PomodoroPageController extends GetxController {
  RxInt valueTimer = 10.obs;
  RxInt valueBreak = 10.obs;

  void change_timer_value(int value) {
    valueTimer.value = value;
  }

  void change_break_value(int value) {
    valueBreak.value = value;
  }
}
