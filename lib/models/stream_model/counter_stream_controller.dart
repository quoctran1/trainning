import 'dart:async';

import 'package:trainning/models/stream_model/counter_stream.dart';

class CounterStreamController {
  int count = 0;
  StreamController<int> streamController;

  CounterStreamController._(this.streamController);

  Stream<int> get getStream => streamController.stream;

  //region init
  factory CounterStreamController.init() {
    final streamController = StreamController<int>();
    return CounterStreamController._(streamController);
  }

  factory CounterStreamController.broadcast() {
    final streamController = StreamController<int>.broadcast();
    return CounterStreamController._(streamController);
  }

  //endregion
  //region transform
  Stream<int> get getStreamTransform =>
      streamController.stream.transform(streamTransformer);

  StreamTransformer<int, int> streamTransformer =
      StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    int temp = data * 2;
    sink.add(temp);
  });

  //endregion

  //region addData
  void addData() {
    streamController.add(10);
  }

  void addStream() {
    final stream = CounterStream().createCountStream();
    streamController.addStream(stream);
  }

//endregion
}