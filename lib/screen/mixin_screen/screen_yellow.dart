import 'dart:math';

import 'package:flutter/material.dart';

class ScreenYellow extends StatefulWidget {
  const ScreenYellow({super.key});

  @override
  State<ScreenYellow> createState() => _ScreenYellowState();
}

class _ScreenYellowState extends State<ScreenYellow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Text(
        Random().nextInt(20).toString(),
        style: const TextStyle(color: Colors.white, fontSize: 40),
      )),
    );
  }
}
