import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_reward_screen.dart';

import 'package:trainning/utils/app_images/app_images.dart';

class FlipRewardButton extends StatefulWidget {
  const FlipRewardButton({super.key});

  @override
  State<FlipRewardButton> createState() => _FlipRewardButtonState();
}

class _FlipRewardButtonState extends State<FlipRewardButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.icFlipCard),
          const FlipRewardScreen(),
        ],
      ),
    );
  }
}
