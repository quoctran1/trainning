import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String title;

  const ListItemWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    print(title);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.red,
        height: 200,
        child: Text(title));
  }
}
