import 'package:flutter/material.dart';

class GenericScreen extends StatefulWidget {
  const GenericScreen({super.key});

  @override
  State<GenericScreen> createState() => _GenericScreenState();
}

class _GenericScreenState extends State<GenericScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
