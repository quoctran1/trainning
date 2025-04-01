import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_card_inherited.dart';
import 'package:trainning/utils/app_images/app_images.dart';

class FlipRewardDecorationAnimationContainer extends StatefulWidget {
  final Widget child;

  const FlipRewardDecorationAnimationContainer(
      {super.key, required this.child});

  @override
  State<FlipRewardDecorationAnimationContainer> createState() =>
      _FlipRewardDecorationAnimationContainerState();
}

class _FlipRewardDecorationAnimationContainerState
    extends State<FlipRewardDecorationAnimationContainer>
    with SingleTickerProviderStateMixin {
  late Animation<Decoration> animation;
  late AnimationController controller;
  late DecorationTween tween;
  FlipCardInheritedWidget? flipCardInheritedWidget;

  @override
  void initState() {
    super.initState();

    tween = DecorationTween(
        end: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.gustoGold,
            blurRadius: 36,
            spreadRadius: 0,
            offset: const Offset(
              0,
              10,
            ),
          ),
        ]),
        begin: const BoxDecoration());
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

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: animation,
      child: widget.child,
    );
  }
}
