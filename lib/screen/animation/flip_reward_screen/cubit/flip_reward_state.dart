
abstract class FlipRewardState {}

class InitFlipReward extends FlipRewardState {}

class LoadingFlipReward extends FlipRewardState {}

class GetFlipReward extends FlipRewardState {
  final int flipCardReward;

  GetFlipReward(this.flipCardReward);
}

class ErrorFlipReward extends FlipRewardState {
  final String? message;

  ErrorFlipReward(this.message);
}
