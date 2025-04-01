import 'package:flutter/material.dart';
import 'package:trainning/screen/animation/fade_animation_widget.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_reward_screen.dart';
import 'package:trainning/screen/animation/increase_number_widget.dart';
import 'package:trainning/screen/animation/size_animation_widget.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('IncreaseNumberWidget'),
            IncreaseNumberWidget(),
            Text('FadeAnimationWidget'),
            FadeAnimationWidget(),
            Text('IncreaseNumberWidget'),
            SizeAnimationWidget(),
            FlipRewardScreen(),
          ],
        ),
      ),
    );
  }
}
