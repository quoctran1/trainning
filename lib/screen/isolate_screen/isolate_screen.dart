import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trainning/widget/home_button_widget.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  late ValueNotifier<bool> completeNotifier;

  @override
  void initState() {
    completeNotifier = ValueNotifier(false);

    super.initState();
  }

  @override
  void dispose() {
    completeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CircularProgressIndicator(
              color: Colors.yellow,
            ),
            ValueListenableBuilder(
              valueListenable: completeNotifier,
              builder: (BuildContext context, bool value, Widget? child) {
                if (value) {
                  return const CircularProgressIndicator(
                    color: Colors.red,
                  );
                }
                return const SizedBox();
              },
            ),
            Row(
              children: [
                HomeButtonWidget(
                    title: 'Submit',
                    onTap: () {
                      onClickSubmit(100000000);
                    }),
                HomeButtonWidget(
                    title: 'Heavy',
                    onTap: () {
                      onClickSubmit(5000000000);
                    }),
                HomeButtonWidget(
                    title: 'Isolate',
                    onTap: () {
                      // completeNotifier.value = true;
                      Isolate.run(go);
                      // IsolateController().callFunction(5000000000);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  onClickSubmit(int value) {
    completeNotifier.value = true;
    heavyLoop(value);
  }
  Future<void>go()async{
    heavyLoop(5000000000);
  }
  void heavyLoop(int value) {
    print('start loop');
    int count = 0;
    for (int i = 0; i < value; i++) {
      count += i;
    }
    print('end loop');
  }
}

class IsolateController {
  Future<bool> callFunction(int value) async {
    compute(heavyLoop, 5000000000);
    return false;
  }

  void heavyLoop(int value) {
    print('start loop');
    int count = 0;
    for (int i = 0; i < value; i++) {
      count += i;
    }
    print('end loop');
  }
}
