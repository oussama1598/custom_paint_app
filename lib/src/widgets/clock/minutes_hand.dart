import 'dart:math';

import 'package:flutter/material.dart';

class MinutesHand extends StatelessWidget {
  final int minutes;

  const MinutesHand({
    Key key,
    this.minutes = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MinutesHandPainter(
        minutes: minutes,
      ),
    );
  }
}

class MinutesHandPainter extends CustomPainter {
  final Paint secondsHandPaint;
  final int minutes;

  MinutesHandPainter({this.minutes = 0})
      : secondsHandPaint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = size.width / 2;
    final double radius = offset;
    final double angle = (minutes * ((2 * pi) / 60)) - pi / 2;
    final double x = radius * 0.5 * cos(angle);
    final double y = radius * 0.5 * sin(angle);
    final Path path = Path();

    path.moveTo(offset, offset);
    path.lineTo(offset + x, offset + y);

    canvas.drawPath(path, secondsHandPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
