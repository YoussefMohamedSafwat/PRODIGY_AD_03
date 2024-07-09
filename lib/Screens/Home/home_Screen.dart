import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stopwatch stopwatch;
  late Timer t;

  void startStopWatch() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
    }
  }

  void pauseStopWatch() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    }
  }

  void resetStopWatch() {
    stopwatch.stop();
    stopwatch.reset();
  }

  @override
  void initState() {
    super.initState();

    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(microseconds: 30), (timer) {
      setState(() {});
    });
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(returnFormattedText(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  startStopWatch();
                },
                icon: const Icon(
                  Icons.play_circle,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  pauseStopWatch();
                },
                icon: const Icon(
                  Icons.pause_circle,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  resetStopWatch();
                },
                icon: const Icon(
                  Icons.stop_circle,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
