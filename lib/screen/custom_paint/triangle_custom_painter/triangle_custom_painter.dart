import 'package:flutter/material.dart';

class TriangleCustomPainter extends StatelessWidget {
  const TriangleCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Triangle Custom Painter"),
      ),
      backgroundColor: Colors.grey,
      body: CustomPaint(
        size: const Size(100, 100),
        painter: RPSCustomPainter(),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(40, 40);
    path_0.lineTo(80, 40);
    path_0.lineTo(40, 80);

    path_0.close();
    //fill color
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    paint_0_fill.blendMode = BlendMode.srcOver;

    //Border color
    Paint paint_0_stroke = Paint()..style = PaintingStyle.stroke;
    paint_0_stroke.color = Colors.red.withOpacity(1.0);
    paint_0_stroke.strokeWidth = 1;
    canvas.drawPath(path_0, paint_0_stroke);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
