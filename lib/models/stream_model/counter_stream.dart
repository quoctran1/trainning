import 'dart:math';

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
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      count += i;
    }
    return count;
  }

  Future<int> simpleFuture() async {
    await Future.delayed(const Duration(seconds: 1));
    return 100;
  }

  Future<int> simpleFuture1() async {
    return 200;
  }

  Stream<int> getFromFuture() async* {
    yield* Stream.fromFuture(createCountFuture());
  }

  Stream<int> getListFuture() async* {
    yield* Stream.fromFutures(
        [createCountFuture(), simpleFuture(), simpleFuture1()]);
  }

  Stream<String> getIterableFuture() async* {
    List<String> userIds = ['1', '2', '3', '5', '6', '7'];
    final streamIterable = Stream.fromIterable(userIds);
    // Call getUserInfo asynchronously
    yield* streamIterable.asyncMap((id) async {
      String userInfo = await getUserInfo(id);
      return userInfo;
    });
  }

  Future<String> getUserInfo(String id) async {
    int second = Random().nextInt(4);
    await Future.delayed(Duration(seconds: second));

    return 'id: $id ----- $second';
  }
}
