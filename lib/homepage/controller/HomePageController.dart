import 'package:get/state_manager.dart';
import 'dart:async';

class HomepageController extends GetxController {
  RxInt secondDigit = 0.obs;
  RxInt minuteDigit = 0.obs;
  RxInt hourDigit = 0.obs;
  RxBool isStarted = false.obs;
  Timer? _timer;
  RxList<String> laps = <String>[].obs;

  void start() {
    isStarted.value = !isStarted.value;
    if (isStarted.value) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        secondDigit.value++;
        if (secondDigit.value > 59) {
          minuteDigit.value++;
          secondDigit.value = 0;
        }
        if (minuteDigit.value > 59) {
          hourDigit.value++;
          minuteDigit.value = 0;
        }
      });
    } else {
      _timer?.cancel();
    }
  }

  void addLaps(String lap) {
    laps.add(lap);
  }

  void reset() {
    laps.value = [];
    _timer?.cancel();
    secondDigit.value = 0;
    minuteDigit.value = 0;
    hourDigit.value = 0;
    isStarted.value = false;
  }
}
