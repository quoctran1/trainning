import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainning/screen/bloc_screen/loading_bloc/loading_bloc_state.dart';

class LoadingCubit extends Cubit<LoadingBlocState> {
  LoadingCubit() : super(InitLoadingState());

  void getData() async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));
      final list = List<String>.generate(
          20, (index) => Random.secure().nextInt(20).toString());
      emit(GetDataState(list));
      // emit(ErrorState());
      FirebaseAnalytics.instance.logEvent(name: 'event_name');
    } catch (e) {
      emit(ErrorState());
    }
  }
}
