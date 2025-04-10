import 'package:flutter/material.dart';
import 'package:trainning/screen/custom_paint/item_background_custom_painter.dart';

class CustomPaintScreen extends StatefulWidget {
  const CustomPaintScreen({super.key});

  @override
  State<CustomPaintScreen> createState() => _CustomPaintScreenState();
}

class _CustomPaintScreenState extends State<CustomPaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: const BubbleChatCustomPaint(),
      body: const ItemBackgroundCustomPaint(),
    );
  }
}
