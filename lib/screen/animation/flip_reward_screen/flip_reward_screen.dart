import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trainning/screen/animation/flip_reward_screen/cubit/flip_reward_cubit.dart';
import 'package:trainning/screen/animation/flip_reward_screen/cubit/flip_reward_state.dart';
import 'package:trainning/screen/animation/flip_reward_screen/flip_card_inherited.dart';
import 'package:trainning/widget/home_button_widget.dart';

import 'widget/flip_reward_size_animate_container.dart';

class FlipRewardScreen extends StatefulWidget {
  const FlipRewardScreen({super.key});

  @override
  State<FlipRewardScreen> createState() => _FlipRewardScreenState();
}

class _FlipRewardScreenState extends State<FlipRewardScreen> {
  late BehaviorSubject<bool> onTapSubject, onStartSubject;
  late BehaviorSubject<int> onEndSubject;
  late ValueNotifier<bool> enableNotifier;
  late ValueNotifier<int> cardCountNotifier;
  late FlipRewardCubit flipRewardCubit;

  @override
  void initState() {
    onTapSubject = BehaviorSubject();
    onEndSubject = BehaviorSubject();
    onStartSubject = BehaviorSubject();
    cardCountNotifier = ValueNotifier(10);
    enableNotifier = ValueNotifier(true);
    flipRewardCubit = FlipRewardCubit();
    if (cardCountNotifier.value == 0) {
      enableNotifier.value = false;
    }
    super.initState();
  }

  @override
  void dispose() {
    onTapSubject.close();
    onEndSubject.close();
    onStartSubject.close();
    enableNotifier.dispose();
    cardCountNotifier.dispose();
    flipRewardCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlipCardInheritedWidget(
        onStart: onStartSubject,
        onEnd: onEndSubject,
        onTap: onTapSubject,
        enableNotifier: enableNotifier,
        cardCountNotifier: cardCountNotifier,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            const FlipRewardSizeAnimateContainer(),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: BlocConsumer(
                    bloc: flipRewardCubit,
                    listener: (BuildContext context, state) {
                      if (state is GetFlipReward) {
                        onEndSubject.add(state.flipCardReward);
                        cardCountNotifier.value =
                            max(cardCountNotifier.value - 1, 0);
                        if (cardCountNotifier.value == 0) {
                          enableNotifier.value = false;
                        }
                      }
                    },
                    builder: (BuildContext context, Object? state) {
                      return ValueListenableBuilder(
                        valueListenable: enableNotifier,
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return HomeButtonWidget(
                            title: 'Open',
                            onTap: () {
                              onTapSubject.add(true);
                              flipRewardCubit.flipReward();
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
