import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class FlipCardInheritedWidget extends InheritedWidget {
  final BehaviorSubject<bool> onStart;
  final BehaviorSubject<int> onEnd;
  final BehaviorSubject<bool> onTap;
  final ValueNotifier<bool> enableNotifier;
  final ValueNotifier<int> cardCountNotifier;

  const FlipCardInheritedWidget({
    super.key,
    required super.child,
    required this.onStart,
    required this.onEnd,
    required this.onTap,
    required this.enableNotifier,
    required this.cardCountNotifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static FlipCardInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FlipCardInheritedWidget>();
  }
}
