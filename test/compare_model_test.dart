import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Nullable', () {
    test('Non-null', () {
      int one = 1;
      int two = 1;
      Demo demo1 = Demo('mot');
      Demo demo2 = Demo('mot');
      Demo demo3 = demo1;

      // print(demo1 == demo2);
      // List<int> list1 = [1];
      // List<int> list2 = [1];
      // print((list1 == list2));
      // print(listEquals(list1, list2));
      print(identical(demo1, demo2));
      ;
      print(identical(demo1, demo3));
      ;
      // String string1 = '11';
      // String string2 = '11';
      // bool temp = false;
      // double number = 1.1;
      //
      // Utils uti = Utils();
    });
  });
}

class Utils {
  List<T> getTwoGeneric<T>(List<T> list) {
    return [list.first, list.last];
  }

  List<dynamic> getTwoDynamic(List<dynamic> list) {
    return [list.first, list.last];
  }

  T getValue<T>(T value) {
    return value;
  }

  dynamic getValueDyna(dynamic value) {
    return value;
  }
}

class Demo {
  String? name;

  Demo(this.name);

  @override
  int get hashCode {
    return name.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return (other is Demo) && name == other.name;
  }
}
