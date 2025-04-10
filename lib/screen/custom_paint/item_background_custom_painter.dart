import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class ItemBackgroundCustomPaint extends StatelessWidget {
  const ItemBackgroundCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
  return  CustomPaint(
      size: Size(100, (100*0.7325842696629213).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: ItemBackgroundCustomPainter(),
    );

  }
}

class ItemBackgroundCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.07416899,size.height*0.6881656);
    path_0.cubicTo(size.width*0.01978187,size.height*0.5781012,size.width*-0.007411708,size.height*0.5230675,size.width*0.004840202,size.height*0.4705307);
    path_0.cubicTo(size.width*0.01709209,size.height*0.4179939,size.width*0.06258764,size.height*0.3945491,size.width*0.1535787,size.height*0.3476534);
    path_0.lineTo(size.width*0.7694584,size.height*0.03025120);
    path_0.cubicTo(size.width*0.8129146,size.height*0.007855767,size.width*0.8346427,size.height*-0.003341933,size.width*0.8549146,size.height*0.005467117);
    path_0.cubicTo(size.width*0.8751865,size.height*0.01427617,size.width*0.8881753,size.height*0.04055859,size.width*0.9141483,size.height*0.09312393);
    path_0.lineTo(size.width*0.9548966,size.height*0.1755887);
    path_0.cubicTo(size.width*0.9871596,size.height*0.2408773,size.width*1.003290,size.height*0.2735218,size.width*0.9984539,size.height*0.3074847);
    path_0.cubicTo(size.width*0.9936157,size.height*0.3414479,size.width*0.9697011,size.height*0.3634663,size.width*0.9218719,size.height*0.4075061);
    path_0.lineTo(size.width*0.3453865,size.height*0.9382914);
    path_0.cubicTo(size.width*0.2975573,size.height*0.9823282,size.width*0.2736427,size.height*1.004347,size.width*0.2487618,size.height*0.9977454);
    path_0.cubicTo(size.width*0.2238802,size.height*0.9911442,size.width*0.2077497,size.height*0.9585000,size.width*0.1754883,size.height*0.8932086);
    path_0.lineTo(size.width*0.07416899,size.height*0.6881656);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*2.240753,size.height*-53.60307), Offset(size.width*3.047843,size.height*-127.9129), [Color(0xff5936B4).withOpacity(1),Color(0xff362A84).withOpacity(1)], [0,1]);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}