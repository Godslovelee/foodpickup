///Created by Godslove Lee 24.07.2023
///Lasted Edited by Godslove 25.07.2023
///Description: CountDown widget class to display the time left for an order to be Removed/Complete

import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final int initialTime;
  final VoidCallback onTimerFinished;

  CountdownWidget({required this.initialTime, required this.onTimerFinished});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialTime;
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        widget.onTimerFinished();
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;

    return Text(
      'Order  will disappear in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
    );
  }
}
