import 'package:flutter/widgets.dart';
import 'package:stave/src/model/model.dart';

class Stave extends StatefulWidget {
  final Score score;

  Stave(this.score);

  @override
  State createState() => _StaveState();
}

class _StaveState extends State<Stave> {
  GlobalKey _keyStavePaint = GlobalKey();

  double _heigth = 640;
  double _width = 320;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onPostFrameCallback);
    super.initState();
  }

  void _onPostFrameCallback(Duration duration) {
    var renderObject =
        _keyStavePaint.currentContext.findRenderObject() as RenderBox;
    setState(() {
      _width = renderObject.size.width;
      _heigth = renderObject.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: _keyStavePaint,
      painter: StavePainter(
        width: _width,
        height: _heigth,
      ),
    );
  }
}

class StavePainter extends CustomPainter {
  static const lineWidth = 2.0;
  static const spaceWidth = 10.0;
  static const defaultPadding = 0.0;

  final double width;
  final double height;
  final double padding;

  final Paint linePaint = Paint();

  StavePainter({
    @required this.width,
    @required this.height,
    this.padding = defaultPadding,
  }) {
    linePaint
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..color = Color.fromARGB(255, 0, 0, 0)
      ..strokeCap = StrokeCap.square;
  }

  Offset get _paintStart => Offset(padding, padding);

  double get _paintWidth => width - padding * 2;

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
    var vertical = (lineWidth + spaceWidth) * line + lineWidth / 2 + padding;
    return [
      Offset(_paintStart.dx, vertical),
      Offset(width - padding, vertical)
    ];
  }
}
