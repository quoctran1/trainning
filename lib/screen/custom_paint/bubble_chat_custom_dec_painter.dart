import 'package:flutter/material.dart';

class BubbleChatCustomDecPainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final bool isSender;

  BubbleChatCustomDecPainter({
    required this.backgroundColor,
    required this.borderColor,
    required this.isSender,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 16.0;
    final tailHeight = 10.0;
    final tailWidth = 12.0;

    final double tailDx = isSender ? size.width - tailWidth - 8 : 8;

    final path = Path();

    // Start from top-left
    path.moveTo(radius, 0);

    // Top edge
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right edge
    path.lineTo(size.width, size.height - tailHeight - radius);
    path.quadraticBezierTo(
      size.width,
      size.height - tailHeight,
      size.width - radius,
      size.height - tailHeight,
    );

    // Tail for sender
    if (isSender) {
      path.lineTo(tailDx + tailWidth, size.height - tailHeight);
      path.quadraticBezierTo(
        tailDx + tailWidth / 2,
        size.height,
        tailDx,
        size.height - tailHeight,
      );
    }

    // Bottom edge
    path.lineTo(radius, size.height - tailHeight);
    path.quadraticBezierTo(0, size.height - tailHeight, 0, size.height - tailHeight - radius);

    // Left edge
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Tail for receiver
    if (!isSender) {
      path.moveTo(tailDx, size.height - tailHeight);
      path.quadraticBezierTo(
        tailDx + tailWidth / 2,
        size.height,
        tailDx + tailWidth,
        size.height - tailHeight,
      );
    }

    final Paint fillPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final Paint strokePaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant BubbleChatCustomDecPainter oldDelegate) {
    return backgroundColor != oldDelegate.backgroundColor ||
        borderColor != oldDelegate.borderColor ||
        isSender != oldDelegate.isSender;
  }
}