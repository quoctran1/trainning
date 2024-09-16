import 'package:flutter_test/flutter_test.dart';
import 'package:trainning/models/company.dart';

void main() {
  Map<String, dynamic> data = {
    // "id": 1,
    "name": "name",
    // "username": "dwdw",
    "email": "email",
    // "company": {"name": "nameCom", "catchPhrase": "catchPhrase", "bs": "bs"}
  };

  group('Nullable', () {
    test('Non-null', () {
      final user = User.fromJson(data);
      print(user);
    });
  });
}
