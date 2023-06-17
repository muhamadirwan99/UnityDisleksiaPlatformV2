import 'package:flutter/material.dart';

class DotConnectView extends StatefulWidget {
  const DotConnectView({super.key});

  @override
  _DotConnectViewState createState() => _DotConnectViewState();
}

class _DotConnectViewState extends State<DotConnectView> {
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dot Connect'),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            points = List.from(points)..add(details.localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) {
          setState(() {
            points.clear();
          });
        },
        child: CustomPaint(
          painter: LinePainter(points),
          child: Container(),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> points;

  LinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
