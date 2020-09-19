import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stave/src/model/model.dart';

var noteWhole =
'''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   width="453.543"
   height="275.9043"
   viewBox="0 0 119.99992 72.999681"
   version="1.1"
   id="svg60">
  <defs
     id="defs54" />
  <metadata
     id="metadata57">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     id="layer1"
     transform="translate(-36.761945,-90.500159)">
    <path
       d="M 96.761909,90.500159 A 59.999999,36.500001 0 0 0 36.761945,126.99975 59.999999,36.500001 0 0 0 96.761909,163.49984 59.999999,36.500001 0 0 0 156.76186,126.99975 59.999999,36.500001 0 0 0 96.761909,90.500159 Z m -6.097309,6.01565 a 32.000005,21.5 68.032104 0 1 26.26765,22.704051 32.000005,21.5 68.032104 0 1 -7.96851,37.71966 32.000005,21.5 68.032104 0 1 -31.909669,-21.63381 32.000005,21.5 68.032104 0 1 7.96798,-37.719161 32.000005,21.5 68.032104 0 1 5.642549,-1.07074 z"
       style="fill:#000000;fill-rule:evenodd;stroke-width:0.412118"
       id="path10-1" />
  </g>
</svg>
''';

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

  Picture picture;

  Future<DrawableRoot> getSvg() async {
    return svg.fromSvgString(noteWhole, noteWhole);
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onPostFrameCallback);
    getSvg().then((value) {
      setState(() {
        picture = value.toPicture(
            size: Size(StavePainter.spaceWidth * 1.5, StavePainter.spaceWidth));
      });
    });
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
        picture: picture,
      ),
    );
  }
}

class StavePainter extends CustomPainter {
  static const lineWidth = 1.0;
  static const spaceWidth = 10.0;
  static const defaultPadding = 0.0;

  final double width;
  final double height;
  final double padding;

  final Picture picture;

  final Paint linePaint = Paint();

  StavePainter({
    @required this.width,
    @required this.height,
    this.padding = defaultPadding,
    this.picture,
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

    if (picture != null) {
      canvas.drawPicture(picture);
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
