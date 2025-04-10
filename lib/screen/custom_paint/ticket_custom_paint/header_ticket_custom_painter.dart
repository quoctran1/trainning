import 'package:flutter/material.dart';

class HeaderTicketCustomPainter extends StatelessWidget {
  const HeaderTicketCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RPSCustomPainter(),
      child: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: IntrinsicHeight(
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'JKT',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Jakata',
                      style: TextStyle(
                          color: Color(0xff636363),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      height: 20,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    child: Transform.rotate(
                      angle: 1.5707963267948966,
                      child: const Icon(Icons.airplanemode_on),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      height: 20,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 20,
                  ),
                ],
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'JKT',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Jakata',
                      style: TextStyle(
                          color: Color(0xff636363),
                          fontWeight: FontWeight.normal),
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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.05405405);
    path_0.cubicTo(0, size.height * 0.02420088, size.width * 0.01102068, 0,
        size.width * 0.02461538, 0);
    path_0.lineTo(size.width * 0.9753846, 0);
    path_0.cubicTo(size.width * 0.9889785, 0, size.width,
        size.height * 0.02420081, size.width, size.height * 0.05405405);
    path_0.lineTo(size.width, size.height * 0.9054595);
    path_0.cubicTo(
        size.width * 0.9994892,
        size.height * 0.9054257,
        size.width * 0.9989754,
        size.height * 0.9054054,
        size.width * 0.9984615,
        size.height * 0.9054054);
    path_0.cubicTo(
        size.width * 0.9743354,
        size.height * 0.9054054,
        size.width * 0.9546831,
        size.height * 0.9474527,
        size.width * 0.9538708,
        size.height);
    path_0.lineTo(size.width * 0.04612769, size.height);
    path_0.cubicTo(
        size.width * 0.04531692,
        size.height * 0.9474527,
        size.width * 0.02566397,
        size.height * 0.9054054,
        size.width * 0.001538462,
        size.height * 0.9054054);
    path_0.cubicTo(
        size.width * 0.001023557,
        size.height * 0.9054054,
        size.width * 0.0005106892,
        size.height * 0.9054257,
        0,
        size.height * 0.9054595);
    path_0.lineTo(0, size.height * 0.05405405);
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
