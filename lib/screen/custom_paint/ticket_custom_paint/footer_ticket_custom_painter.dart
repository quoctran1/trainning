import 'package:flutter/material.dart';
import 'package:trainning/screen/custom_paint/ticket_custom_paint/ticket_custom_paint.dart';

class FooterTicketCustomPainter extends StatelessWidget {
  const FooterTicketCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(ticketWidth, (ticketWidth * 0.4553846153846154).toDouble()),
      painter: RPSCustomPainter(),
      child: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(children: [
                    WidgetSpan(
                        child: Text(
                      '\$215',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff313131)),
                    )),
                    WidgetSpan(
                        child: Text(
                      '/passenger',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: Color(0xff313131)),
                    )),
                  ])),
            ),
            const Expanded(
              child: Text(
                '1 passenger',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xff313131)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1036407);
    path_0.lineTo(0, size.height * 0.9407407);
    path_0.cubicTo(0, size.height * 0.9734667, size.width * 0.01102071,
        size.height, size.width * 0.02461542, size.height);
    path_0.lineTo(size.width * 0.9753846, size.height);
    path_0.cubicTo(size.width * 0.9889785, size.height, size.width,
        size.height * 0.9734667, size.width, size.height * 0.9407407);
    path_0.lineTo(size.width, size.height * 0.1036407);
    path_0.cubicTo(
        size.width * 0.9994892,
        size.height * 0.1036830,
        size.width * 0.9989754,
        size.height * 0.1037037,
        size.width * 0.9984615,
        size.height * 0.1037037);
    path_0.cubicTo(
        size.width * 0.9743354,
        size.height * 0.1037037,
        size.width * 0.9546831,
        size.height * 0.05760452,
        size.width * 0.9538708,
        0);
    path_0.lineTo(size.width * 0.04612769, 0);
    path_0.cubicTo(
        size.width * 0.04531692,
        size.height * 0.05760452,
        size.width * 0.02566397,
        size.height * 0.1037037,
        size.width * 0.001538462,
        size.height * 0.1037037);
    path_0.cubicTo(
        size.width * 0.001023557,
        size.height * 0.1037037,
        size.width * 0.0005106892,
        size.height * 0.1036830,
        0,
        size.height * 0.1036407);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
