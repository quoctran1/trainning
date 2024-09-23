class CounterStream {
  Stream<int> createCountStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  Stream<int> getAll() async* {
    yield* createCountStream();
    yield 100;
  }

  Future<int> createCountFuture() async {
    int count = 0;
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      count += i;
    }
    return count;
  }
}
