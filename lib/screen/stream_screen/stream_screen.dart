import 'package:flutter/material.dart';
import 'package:trainning/models/stream_model/counter_stream.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  late CounterStream counterStream;
  late Stream<int> stream;

  @override
  void initState() {
    counterStream = CounterStream();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<int>(
              stream: counterStream.createCountStream(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Flexible(
                      child: Text(
                    "${snapshot.data}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30),
                  ));
                }
                return const Text(
                  'Error',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
            // StreamBuilder<String>(
            //   stream: counterStream.getIterableFuture(),
            //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //
            //     if (snapshot.hasData) {
            //       return Flexible(
            //           child: Text(
            //         "${snapshot.data}",
            //         textAlign: TextAlign.center,
            //         style: const TextStyle(fontSize: 30),
            //       ));
            //     }
            //     return const Text(
            //       'Error',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(fontSize: 30),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
