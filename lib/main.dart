import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch/bindings/ControllerBindings.dart';
import 'package:stopwatch/screens/landingpage/view/LandingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
