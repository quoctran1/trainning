import 'package:flutter/cupertino.dart';

class InheritedContainer extends InheritedWidget {
  final String name;

  const InheritedContainer({
    super.key,
    required super.child,
    required this.name,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static InheritedContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedContainer>();
  }
}
