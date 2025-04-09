import 'package:flutter/material.dart';
import 'package:trainning/screen/custom_paint/bubble_chat_painter.dart';

class BubbleChatCustomPaint extends StatelessWidget {
  const BubbleChatCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.sizeOf(context).width,
          (100 * 0.20588235294117646).toDouble()),
      painter: BubbleChatCustomPainter(
          ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('''Performing hot reload...
          Syncing files to device iPhone 16 Plus...
          Reloaded 1 of 1624 libraries in 495ms (compile: 17 ms, reload: 127 ms, reassemble: 288 ms).'''),
      ),
    );
  }
}
