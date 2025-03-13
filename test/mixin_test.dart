import 'package:flutter_test/flutter_test.dart';
import 'package:trainning/models/mixin_model/animal.dart';

void main() {
  group('Nullable', () {
    test('Non-null', () {
      // Animal animal = Animal();
      // final result = animal.logData();
      // print(result);

      final one = doSomeThing(() {
        print('123123');
      });
    });
  });
}

void doSomeThing(Function function) {
  print('header');

  function();

  print('tail');
}
