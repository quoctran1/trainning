import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_card_inherited.dart';
import 'package:trainning/utils/app_images/app_images.dart';

class FlipCardItem extends StatefulWidget {
  final double width, height;
  final String initValue, resultValue;
  final bool enable;

  const FlipCardItem({
    super.key,
    required this.width,
    required this.height,
    required this.initValue,
    required this.resultValue,
    this.enable = true,
  });

  @override
  State<FlipCardItem> createState() => _FlipCardItemState();
}

class _FlipCardItemState extends State<FlipCardItem>
    with  SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Rect?> _animation;
  late ValueNotifier<bool> valueNotifier;
  FlipCardInheritedWidget? flipCardInheritedWidget;

  double iconWidth = 0,
      containerHeight = 0,
      containerWidth = 0,
      positionIcon = 0;

  @override
  void initState() {
    super.initState();
    iconWidth = widget.width - 10;
    containerHeight = widget.height;
    containerWidth = widget.width;
    positionIcon = containerWidth / 3;
    valueNotifier = ValueNotifier(false);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = RectTween(
      begin: const Rect.fromLTRB(10, -50, 20, 0),
      end: Rect.fromLTRB(10, 0, 20, containerHeight + iconWidth * 2),
    ).animate(_controller);
    _controller.animateTo(0.5);

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      if (!widget.enable) return;

      flipCardInheritedWidget?.onTap.listen((value) {
        addListener();
      });
      flipCardInheritedWidget?.onEnd.listen((value) {
        _controller.animateTo(0.5);
        valueNotifier.value = true;
      });
    });
  }

  @override
  void didChangeDependencies() {
    flipCardInheritedWidget = FlipCardInheritedWidget.of(context)!;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    valueNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.autumnChild,
                AppColor.white,
              ]),
          border: Border.all(
            color: AppColor.piecesOfEight,
            width: 2,
          )),
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (BuildContext context, bool value, Widget? child) {
          return Stack(
            children: [
              RelativePositionedTransition(
                rect: _animation,
                size: Size(iconWidth, iconWidth),
                child: Center(
                  child: Text(
                    value ? widget.resultValue : widget.initValue,
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                       ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void addListener() {
    _controller.repeat();
    valueNotifier.value = false;
  }
}
