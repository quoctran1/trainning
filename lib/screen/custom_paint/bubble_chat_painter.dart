import 'package:flutter/material.dart';

class BubbleChatCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xFFFFAE38).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001837338, 0, size.width * 0.9816176,
                size.height),
            bottomRight: Radius.circular(size.width * 0.06617647),
            bottomLeft: Radius.circular(size.width * 0.06617647),
            topLeft: Radius.circular(size.width * 0.06617647),
            topRight: Radius.circular(size.width * 0.06617647)),
        paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9977463, size.height * 0.9854393);
    path_1.cubicTo(
        size.width * 0.9786287,
        size.height * 0.9997250,
        size.width * 0.9597574,
        size.height * 0.9485929,
        size.width * 0.9536287,
        size.height * 0.9158554);
    path_1.cubicTo(
        size.width * 0.9599449,
        size.height * 0.8427036,
        size.width * 0.9209522,
        size.height * 0.6650339,
        size.width * 0.9466875,
        size.height * 0.6650268);
    path_1.cubicTo(
        size.width * 0.9526397,
        size.height * 0.6650268,
        size.width * 0.9577206,
        size.height * 0.5893107,
        size.width * 0.9793640,
        size.height * 0.6461536);
    path_1.cubicTo(
        size.width * 0.9794449,
        size.height * 0.6691321,
        size.width * 0.9793640,
        size.height * 0.7486750,
        size.width * 0.9793640,
        size.height * 0.7622179);
    path_1.cubicTo(
        size.width * 0.9793640,
        size.height * 0.9497179,
        size.width * 1.001423,
        size.height * 0.9746661,
        size.width * 0.9977463,
        size.height * 0.9854393);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xFFFFAE38).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
