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
  static const lineWidth = 2.0;
  static const spaceWidth = 10.0;

  final Paint linePaint = Paint();

  StavePainter() {
    linePaint
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..color = Color.fromARGB(255, 0, 0, 0)
      ..strokeCap = StrokeCap.square;
  }

  double get containerWidth => 300.0;

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsets;
    for (int i = 0; i <= 5; i++) {
      offsets = _lineOffsets(i);
      canvas.drawLine(offsets[0], offsets[1], linePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  List<Offset> _lineOffsets(int line) {
    var vertical = (lineWidth + spaceWidth) * line + lineWidth / 2;
    return [Offset(0.0, vertical), Offset(containerWidth, vertical)];
  }
}
