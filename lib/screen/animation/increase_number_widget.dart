import 'package:flutter/material.dart';

class IncreaseNumberWidget extends StatefulWidget {
  const IncreaseNumberWidget({super.key});

  @override
  State<IncreaseNumberWidget> createState() => _IncreaseNumberWidgetState();
}

class _IncreaseNumberWidgetState extends State<IncreaseNumberWidget>
    with TickerProviderStateMixin {
  late Tween<double> tween;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    tween = Tween(begin: 0, end: 100);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));

    animation = tween.animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeOutExpo));

    animationController.addStatusListener((status){
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
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            border: Border.all(color: Colors.green.shade300, width: 8)),
        width: 120,
        height: 120,
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Center(
                child: Text(
              animation.value.toStringAsFixed(0).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ));
          },
        ),
      ),
    );
  }
}
