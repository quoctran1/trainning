import 'package:flutter/material.dart';

class LinkableScreen extends StatefulWidget {
  const LinkableScreen({super.key});

  @override
  State<LinkableScreen> createState() => _LinkableScreenState();
}

class _LinkableScreenState extends State<LinkableScreen> {
  late CompositedTransformFollower compositedTransformFollower;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
