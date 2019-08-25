import 'dart:math';

import 'package:flutter/material.dart';

class HourHand extends StatelessWidget {
  final int hours;

  const HourHand({
    Key key,
    this.hours = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HourHandPainter(hours: hours),
    );
  }
}

class HourHandPainter extends CustomPainter {
  final Paint hourHandPaint;
  final int hours;

  HourHandPainter({this.hours = 5})
      : hourHandPaint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = size.width / 2;
    final double radius = offset * 0.5;
    final double angle = (hours * ((2 * pi) / 12)) - pi / 2;
    final double x = radius * 0.5 * cos(angle);
    final double y = radius * 0.5 * sin(angle);
    final Path path = Path();

    path.moveTo(offset, offset);
    path.lineTo(offset + x, offset + y);

    canvas.drawPath(path, hourHandPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
