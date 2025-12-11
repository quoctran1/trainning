
enum OperationType {
  addition,
  subtraction,
  multiplication,
  division
}
abstract class BaseCalculatorWidget {
  double calculate(double a, double b);
  String getTitle() => 'Addition';
  OperationType getWidgetType();
}
class AdditionCalculatorWidget extends BaseCalculatorWidget {
  @override
  double calculate(double a, double b) {
    return a + b;
  }

  @override
  String getTitle() => 'Addition';

  @override
  OperationType getWidgetType() => OperationType.addition;
}
class User {
  final int id;
  String firstName;
  String lastName;
  int? age;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.age,
  });

  String get fullName => '$firstName $lastName';
  bool get isAdult => age != null && age! >= 18;
  String get ageStr => age != null ? age.toString() : 'N/A';

  // Parse từ JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['firstName']!=null?json['firstName']:null,
      lastName: json['lastName'] as String,
      age: json['age'] as int?,
    );
  }

  // Convert sang JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'firstName': firstName, 'lastName': lastName, 'age': age};
  }
}
