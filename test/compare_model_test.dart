import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Nullable', () {
    test('Non-null', () {
      // int one = 1;
      // int two = 1;
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
