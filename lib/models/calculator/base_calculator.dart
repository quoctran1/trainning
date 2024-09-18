abstract class BaseCalculator {
  late String methodName;
  String? result;

  BaseCalculator({required this.methodName, this.result});

  num calculateResult();

  String getResult();

  String getName() {
    return 'dw';
  }
}



class SumCalculator extends BaseCalculator {
  SumCalculator({required super.methodName});

  @override
  num calculateResult() {
    int sum = 1 + 1;
    result = sum.toString();
    return sum;
  }

  @override
  String getResult() {
    return result ?? '';
  }
}

class SubtractCalculator extends BaseCalculator {
  SubtractCalculator({required super.methodName});

  @override
  num calculateResult() {
    int sum = 10 - 1;
    result = sum.toString();
    return sum;
  }

  @override
  String getResult() {
    return "Subtract:${result ?? ''}";
  }
}
