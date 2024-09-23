import 'package:flutter/material.dart';

class ContainerYellowWidget extends StatefulWidget {
  final String name;

  const ContainerYellowWidget({super.key, required this.name});

  @override
  State<ContainerYellowWidget> createState() => _ContainerYellowWidgetState();
}

class _ContainerYellowWidgetState extends State<ContainerYellowWidget> {
  @override
  Widget build(BuildContext context) {
      print('ContainerYellowWidget');
    return Container(
      color: Colors.yellow,
      height: 100,
      child: Column(
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
