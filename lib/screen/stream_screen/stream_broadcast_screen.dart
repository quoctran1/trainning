import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/models/stream_model/counter_stream_controller.dart';
import 'package:trainning/widget/home_button_widget.dart';

class StreamBroadcastScreen extends StatefulWidget {
  const StreamBroadcastScreen({super.key});

  @override
  State<StreamBroadcastScreen> createState() => _StreamBroadcastScreenState();
}

class _StreamBroadcastScreenState extends State<StreamBroadcastScreen> {
  late CounterStreamController counterStreamController;
  late StreamSubscription<int> streamSubscription;

  @override
  void initState() {
    counterStreamController = CounterStreamController.broadcast();

    //region listen

    counterStreamController.streamController.stream.listen((event) {
      print("listen: $event");
    });
    // streamSubscription = counterStreamController.getStream.listen((event) {
    //   print('streamSubscription : $event');
    // });
    //endregion
    super.initState();
  }

  @override
  void dispose() {
    counterStreamController.streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<int>(
              initialData: 1110,
              stream: counterStreamController.getStreamTransform,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data} ${Random().nextInt(20)}");
                }
                return const Text('Error');
              },
            ),
            HomeButtonWidget(
                title: 'Submit',
                onTap: () {
                  counterStreamController.addData();
                }),
            const Divider(
              color: Colors.red,
            ),
            const Text('StreamSubscription'),
            Row(
              children: [
                HomeButtonWidget(
                    title: 'Pause',
                    onTap: () {
                      streamSubscription.pause();
                    }),
                HomeButtonWidget(
                    title: 'Resume',
                    onTap: () {
                      streamSubscription.resume();
                    }),
                HomeButtonWidget(
                    title: 'Cancel',
                    onTap: () {
                      streamSubscription.cancel();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
