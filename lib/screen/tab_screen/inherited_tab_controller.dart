import 'package:flutter/material.dart';
import 'package:trainning/screen/tab_screen/tab_screen.dart';

class InheritedTabController extends InheritedWidget {
  final ValueNotifier<InsertData?> valueNotifier;

  const InheritedTabController( {
    super.key,
    required super.child,
    required this.valueNotifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static InheritedTabController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedTabController>();
  }
}
