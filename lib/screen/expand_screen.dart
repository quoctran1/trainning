import 'package:flutter/material.dart';

class ExpandScreen extends StatefulWidget {
  const ExpandScreen({super.key});

  @override
  State<ExpandScreen> createState() => _ExpandScreenState();
}

class _ExpandScreenState extends State<ExpandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(color: Colors.red, child: Text('Red'))),
            // Container(width: 20,),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(color: Colors.green, child: Text('green'))),
          ],
        ),
      ),
    );
  }
}
