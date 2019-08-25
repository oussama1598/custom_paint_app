import 'dart:math';

import 'package:flutter/material.dart';

class SecondsHand extends StatelessWidget {
  final int seconds;

  const SecondsHand({
    Key key,
    this.seconds = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SecondsHandPainter(
        seconds: seconds,
      ),
    );
  }
}

class SecondsHandPainter extends CustomPainter {
  final Paint secondsHandPaint;
  final int seconds;

  SecondsHandPainter({this.seconds = 5})
      : secondsHandPaint = Paint()
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = size.width / 2;
    final double radius = offset * 0.9;
    final double angle = (seconds * ((2 * pi) / 60)) - pi / 2;
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
