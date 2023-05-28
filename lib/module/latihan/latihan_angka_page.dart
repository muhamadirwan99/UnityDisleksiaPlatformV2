import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/action_button.dart';

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({required this.point, required this.areaPaint});
}

class LatihanAngkaPage extends StatefulWidget {
  final String value;

  const LatihanAngkaPage({Key? key, required this.value}) : super(key: key);

  @override
  State<LatihanAngkaPage> createState() => _LatihanAngkaPageState();
}

class _LatihanAngkaPageState extends State<LatihanAngkaPage> {
  List<DrawingArea?> points = [];
  late Color selectedColor;
  late double strokeWidth;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 2.0;
  }

  void selectColor() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Color Chooser'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: selectedColor,
                onColorChanged: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Angka',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: gray100),
          ),
        ),
        titleTextStyle: const TextStyle(color: gray900),
        elevation: 0,
        backgroundColor: blue500,
        actions: const [
          ActionButton(),
        ],
      ),
      backgroundColor: blue500,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 380,
                decoration: const BoxDecoration(
                  color: blue100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contoh",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.value,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 200,
                                fontWeight: FontWeight.w100,
                                letterSpacing: -0.3,
                                color: gray900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: width,
                height: height * 0.4,
                decoration: const BoxDecoration(
                  color: gray100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: GestureDetector(
                  onPanDown: (details) {
                    setState(() {
                      points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: Paint()
                            ..strokeCap = StrokeCap.round
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: Paint()
                            ..strokeCap = StrokeCap.round
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      points.add(null);
                    });
                  },
                  child: SizedBox.expand(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: CustomPaint(
                        painter: MyCustomPainter(points: points),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Container(
                width: width,
                decoration: const BoxDecoration(
                    color: gray100,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.color_lens,
                        color: selectedColor,
                      ),
                      onPressed: () {
                        selectColor();
                      },
                    ),
                    GestureDetector(
                      child: IconButton(
                        icon: const Icon(
                          Icons.undo,
                        ),
                        onPressed: () {
                          setState(() {
                            if (points.length > 100) {
                              points.removeRange(
                                  points.length - 20, points.length);
                            } else if (points.length > 50) {
                              points.removeRange(
                                  points.length - 10, points.length);
                            } else if (points.length > 25) {
                              points.removeRange(
                                  points.length - 5, points.length);
                            } else if (points.length > 10) {
                              points.removeRange(
                                  points.length - 2, points.length);
                            } else if (points.length > 1) {
                              points.removeRange(
                                  points.length - 1, points.length);
                            } else {}
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        min: 1.0,
                        max: 7.0,
                        activeColor: selectedColor,
                        value: strokeWidth,
                        onChanged: (value) {
                          setState(() {
                            strokeWidth = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.layers_clear),
                      onPressed: () {
                        setState(() {
                          points.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  List<DrawingArea?> points;

  MyCustomPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = gray100;
    Rect rect = Rect.fromLTWH(0, 0, size.width * 0.45, size.height * 0.45);
    canvas.drawRect(rect, background);

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        Paint paint = points[x]!.areaPaint;
        canvas.drawLine(points[x]!.point, points[x + 1]!.point, paint);
      } else if (points[x] != null && points[x + 1] == null) {
        Paint paint = points[x]!.areaPaint;

        canvas.drawPoints(PointMode.points, [points[x]!.point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
