
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainning/screen/animation/flip_reward_screen/cubit/flip_reward_state.dart';

class FlipRewardCubit extends Cubit<FlipRewardState> {

  FlipRewardCubit() : super(InitFlipReward());

  void flipReward() async {
    emit(LoadingFlipReward());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final reward = Random().nextInt(10);

      emit(GetFlipReward(reward));
    } catch (e) {
      emit(ErrorFlipReward(e.toString()));
    }
  }
}
