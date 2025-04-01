import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_card_inherited.dart';
import 'package:trainning/screen/animation/flip_reward_screen/widget/flip_card_item.dart';

import 'package:trainning/utils/app_images/app_images.dart';

class FlipCardAnimateContainer extends StatefulWidget {
  final double containerHeight, containerWidth;

  const FlipCardAnimateContainer(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  State<FlipCardAnimateContainer> createState() =>
      _FlipCardAnimateContainerState();
}

class _FlipCardAnimateContainerState extends State<FlipCardAnimateContainer> {
  double containerHeight = 0, containerWidth = 0, cardContainerHeight = 0;
  late FlipCardInheritedWidget flipCardInheritedWidget;
  List<String> reward = ["?", "?"];

  @override
  void initState() {
    containerHeight = widget.containerHeight;
    containerWidth = widget.containerWidth;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    flipCardInheritedWidget = FlipCardInheritedWidget.of(context)!;

    cardContainerHeight = containerHeight * 0.5;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: containerWidth,
        height: containerHeight,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.mountainMeadow,
            border: Border.all(
              color: AppColor.piecesOfEight,
              width: 3,
            )),
        child: Column(
          children: [
            StreamBuilder(
              stream: flipCardInheritedWidget.onEnd,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  reward = snapshot.data!
                      .toString()
                      .padLeft(2, '0')
                      .split('')
                      .toList();
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.icProfileGem,
                        width: 40, height: 40),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        ":",
                        style: TextStyle(color: AppColor.vanillaIceCream),
                      ),
                    ),
                    FlipCardItem(
                      width: 40,
                      height: cardContainerHeight,
                      initValue: "+",
                      resultValue: "",
                      enable: false,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    FlipCardItem(
                      width: 40,
                      height: cardContainerHeight,
                      initValue: "?",
                      resultValue: reward.first,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    FlipCardItem(
                      width: 40,
                      height: cardContainerHeight,
                      initValue: "?",
                      resultValue: reward.last,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 4,
            ),
            ValueListenableBuilder(
              valueListenable: flipCardInheritedWidget.cardCountNotifier,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(
                  "Remaining Cards: $value",
                  style: const TextStyle(color: Colors.black),
                );
              },
            ),
          ],
        ));
  }
}
