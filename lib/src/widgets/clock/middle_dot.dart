import 'package:flutter/material.dart';

class MiddleDot extends StatelessWidget {
  const MiddleDot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MiddleDotPainter(),
    );
  }
}

class MiddleDotPainter extends CustomPainter {
  final Paint middleDotPaint;
  final Paint middleDotStrokePaint;

  MiddleDotPainter()
      : middleDotPaint = Paint()..color = Colors.white,
        middleDotStrokePaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.red
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = size.width / 2;
    final double radius = 3;

    canvas.drawCircle(
      Offset(offset, offset),
      radius,
      middleDotPaint,
    );
    canvas.drawCircle(
      Offset(offset, offset),
      radius,
      middleDotStrokePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
