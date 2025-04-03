import 'package:flutter/material.dart';

class SizeAnimationWidget extends StatefulWidget {
  const SizeAnimationWidget({super.key});

  @override
  State<SizeAnimationWidget> createState() => _SizeAnimationWidgetState();
}

class _SizeAnimationWidgetState extends State<SizeAnimationWidget>
    with TickerProviderStateMixin {
  late Tween<Size> tween;
  late Animation<Size> animation;
  late AnimationController animationController;

  @override
  void initState() {
    tween = Tween(begin: const Size(50, 50), end: const Size(100, 200));
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = tween.animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    animationController.addStatusListener((status) {
      print(status);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (animationController.isCompleted) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: animation.value.width,
            height: animation.value.height,
            color: Colors.red,
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleOpacity() {
    setState(() {});
  }
}
