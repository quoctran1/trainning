import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/widget/home_button_widget.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Divider(
              color: Colors.red,
            ),
            const Text('Async- Await'),
            Row(
              children: <Widget>[
                HomeButtonWidget(
                  title: 'Sync',
                  onTap: () {
                    onTapSync();
                  },
                ),
                HomeButtonWidget(
                  title: 'Async',
                  onTap: () {
                    onTapASync();
                  },
                ),
              ],
            ),
            const Divider(
              color: Colors.red,
            ),
            const Text('Builder'),
            FutureBuilder<int>(
              future: getInt(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                print(snapshot.connectionState);
                if (snapshot.hasData) {
                  return Text("snapshot.hasData: ${snapshot.hasData} /Data: ${snapshot.data}");
                }
                if (snapshot.hasError) {
                  return Text("snapshot.hasError: ${snapshot.hasError}");
                }

                return Text(snapshot.data.toString());
              },
            ),
          ],
        ),
      ),
    );
  }

  //region Sync
  void onTapSync() {
    print('Start Sync');

    timeConsumingFunction();
    print('Main function completed:  ');
  }

  int timeConsumingFunction() {
    print('Function started...');

    int count = 0;
    for (int i = 0; i < 1000000000; i++) {
      count += i;
    }

    print('Function completed.');
    return count;
  }

  // endregion

  //region Async
  void onTapASync() async {
    print('Start');

    timeConsumingFunctionFuture().then((int value) => print(value));

    // timeConsumingFunctionFuture()
    //     .then((int value) => print(value))
    //     .whenComplete(() => print('whenComplete'))
    //     .onError((error, stackTrace) => print('onError'));

    // timeConsumingFunctionFuture()
    //     .timeout(const Duration(seconds: 2))
    //     .then((int value) => print(value));
    // timeConsumingFunctionFuture()
    //     .then((int value) => print(value))
    //     .timeout(const Duration(seconds: 2));
    print('End');

    print('Main function completed ');
  }

  Future<int> timeConsumingFunctionFuture() async {
    print('Function started...');
    await Future<void>.delayed(const Duration(seconds: 4));
    int count = 0;
    for (int i = 0; i < 10; i++) {
      count += i;
    }

    print('Function completed.');
    return count;
  }

// endregion
  Future<int> getInt() async {
    await Future.delayed(const Duration(seconds: 2));
    // throw Exception();
    return Random().nextInt(20);
  }
}
