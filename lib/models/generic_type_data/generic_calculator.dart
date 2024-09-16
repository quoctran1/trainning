abstract class BaseCalculator<T> {
  late String methodName;
  String? result;

  BaseCalculator({required this.methodName, this.result});

  T calculateResult();

  String getResult();

  String getName() {
    return 'dw';
  }
}