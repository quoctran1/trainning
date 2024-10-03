import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/widget/container_blue_widget.dart';
import 'package:trainning/widget/container_red_widget.dart';
import 'package:trainning/widget/container_yellow_widget.dart';
import 'package:trainning/widget/home_button_widget.dart';

class ValueNotifierScreen extends StatefulWidget {
  const ValueNotifierScreen({super.key});

  @override
  State<ValueNotifierScreen> createState() => _ValueNotifierScreenState();
}

class _ValueNotifierScreenState extends State<ValueNotifierScreen> {
  late ValueNotifier<String> valueNotifierString;
  String blue = 'blue', red = 'red', yellow = 'yellow';
  Name nameVar = Name('1');
  late Timer timer;

  @override
  void initState() {
    valueNotifierString = ValueNotifier('1');
    valueNotifierString.addListener(listenData);
    // valueNotifierString.removeListener(listenData);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    valueNotifierString.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContainerBlueWidget(
                name: blue,
              ),
              ContainerRedWidget(
                name: red,
              ),
              ValueListenableBuilder<String>(
                valueListenable: valueNotifierString,
                builder: (BuildContext context, value, Widget? child) {
                  return ContainerYellowWidget(
                    name: value,
                  );
                },
              ),
              const Spacer(),
              HomeButtonWidget(
                title: 'Click',
                onTap: () {
                  updateData();
                },
              ),
              HomeButtonWidget(
                title: 'Remove',
                onTap: () {
                  timer=  Timer.periodic(const Duration(seconds: 1), (timer) {
                    updateData();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateData() {
    valueNotifierString.value = Random().nextInt(100).toString();
  }

  void listenData() {
    print('Data: ${valueNotifierString.value}');
  }
}

class Name {
  String name;

  Name(this.name);
}
