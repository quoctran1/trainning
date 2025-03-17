abstract class LoadingBlocState {}

class InitLoadingState extends LoadingBlocState {}

class LoadingState extends LoadingBlocState {}

class GetDataState extends LoadingBlocState {
  final List<String> listData;

  GetDataState(this.listData);
}

class ErrorState extends LoadingBlocState {}
