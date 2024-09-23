import 'dart:math';

import 'package:flutter/material.dart';

class ScreenRed extends StatefulWidget {
  const ScreenRed({super.key});

  @override
  State<ScreenRed> createState() => _ScreenRedState();
}

class _ScreenRedState extends State<ScreenRed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          Random().nextInt(20).toString(),
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
