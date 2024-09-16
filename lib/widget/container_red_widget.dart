import 'package:flutter/material.dart';

class ContainerRedWidget extends StatefulWidget {
  final String name;

  const ContainerRedWidget({super.key, required this.name});

  @override
  State<ContainerRedWidget> createState() => _ContainerRedWidgetState();
}

class _ContainerRedWidgetState extends State<ContainerRedWidget> {
  @override
  Widget build(BuildContext context) {
    print('ContainerRedWidget');

    return Container(
      color: Colors.red,
      height: 100,

      child: Column(
        children: [
          Text(widget.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
