class AppImages {
  static const String icPlusPlus = 'assets/images/ic_add_orange.svg';
}

class AppConstant {
  static const double defaultMargin = 16;
}

class AppColor {}

class NativeCodeBridge {
  // Declares an external function. Implementation will be provided elsewhere.
  external static int nativeAdd(int a, int b);
}

class Im {
  void add() {
    NativeCodeBridge.nativeAdd(1, 2);
  }
}
