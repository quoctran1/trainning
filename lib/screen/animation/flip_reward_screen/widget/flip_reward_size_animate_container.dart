import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_card_inherited.dart';
import 'package:trainning/screen/animation/flip_reward_screen/widget/flip_card_animate_container.dart';
import 'package:trainning/screen/animation/flip_reward_screen/widget/flip_reward_decoration_animation_container.dart';
import 'package:trainning/utils/app_images/app_images.dart';

class FlipRewardSizeAnimateContainer extends StatefulWidget {
  const FlipRewardSizeAnimateContainer({super.key});

  @override
  State<FlipRewardSizeAnimateContainer> createState() =>
      _FlipRewardSizeAnimateContainerState();
}

class _FlipRewardSizeAnimateContainerState
    extends State<FlipRewardSizeAnimateContainer>
    with   SingleTickerProviderStateMixin {
  late Tween<double> tween;
  late AnimationController controller;
  late Animation<double> animation;
  double containerHeight = 150, containerWidth = 200;
  FlipCardInheritedWidget? flipCardInheritedWidget;

  @override
  void initState() {
    super.initState();

    tween = Tween(begin: 1, end: 1.02);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = tween.animate(controller);
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      flipCardInheritedWidget?.onEnd.listen((value) {
        controller.forward();
      });
      flipCardInheritedWidget?.onTap.listen((value) {
        if (controller.status == AnimationStatus.dismissed) return;

        controller.reverse();
      });
    });
  }

  @override
  void didChangeDependencies() {
    flipCardInheritedWidget = FlipCardInheritedWidget.of(context)!;

    containerWidth = MediaQuery.sizeOf(context).width * 0.6;
    containerHeight = MediaQuery.sizeOf(context).width * 0.3;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
                  AppImages.flipCardBackground,
                width: MediaQuery.sizeOf(context).width * 0.6),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: ScaleTransition(
              scale: animation,
              child: FlipRewardDecorationAnimationContainer(
                child: FlipCardAnimateContainer(
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
