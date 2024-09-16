import 'package:flutter/material.dart';

class HomeButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? color;
  const HomeButtonWidget({super.key, required this.title, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:color?? Colors.blue,
              border: Border.all(color: Colors.blueAccent)),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white,fontSize: 20),
          )),
    );
  }
}
