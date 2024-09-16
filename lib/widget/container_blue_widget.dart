import 'package:flutter/material.dart';

class ContainerBlueWidget extends StatefulWidget {
  final String name;

  const ContainerBlueWidget({super.key, required this.name});

  @override
  State<ContainerBlueWidget> createState() => _ContainerBlueWidgetState();
}

class _ContainerBlueWidgetState extends State<ContainerBlueWidget> {
  @override
  Widget build(BuildContext context) {
    print('ContainerBlueWidget');
    return Container(
      color: Colors.blue,
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
