import 'dart:async';
import 'package:flutter/material.dart';

///this class is a counter for the 30 minute booking session
class CountdownTimer extends StatefulWidget {
  final int seconds;
  final Function onTimerFinished;

  CountdownTimer({required this.seconds, required this.onTimerFinished});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          widget.onTimerFinished();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    String seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');

    return Text('$minutes:$seconds');
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
