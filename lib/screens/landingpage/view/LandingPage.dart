import 'package:flutter/material.dart';
import 'package:stopwatch/screens/pomodoropage/view/PomodoroPage.dart';
import 'package:stopwatch/screens/stopwatchpage/view/HomePage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> pages = [
    const StopWatchPage(),
    const PomodoroPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
      ),
    );
  }
}
