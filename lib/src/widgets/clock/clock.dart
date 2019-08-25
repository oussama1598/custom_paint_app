import 'dart:async';

import 'package:custom_paint_app/src/widgets/clock/hour_hand.dart';
import 'package:custom_paint_app/src/widgets/clock/middle_dot.dart';
import 'package:custom_paint_app/src/widgets/clock/minutes_hand.dart';
import 'package:custom_paint_app/src/widgets/clock/seconds_hand.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _timer;
  DateTime _dateTime;

  @override
  void initState() {
    _dateTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);

    super.initState();
  }

  void _updateTime(Timer timer) {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          HourHand(
            hours: _dateTime.hour,
          ),
          MinutesHand(
            minutes: _dateTime.minute,
          ),
          SecondsHand(
            seconds: _dateTime.second,
          ),
          MiddleDot(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
