import 'package:flutter/widgets.dart';

class Stave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StavePainter(),
    );
  }
}

class StavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}