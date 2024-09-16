import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/widget/container_blue_widget.dart';
import 'package:trainning/widget/container_red_widget.dart';
import 'package:trainning/widget/container_yellow_widget.dart';

import '../widget/home_button_widget.dart';

class SetStateScreen extends StatefulWidget {
  const SetStateScreen({super.key});

  @override
  State<SetStateScreen> createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  String blue = 'blue', red = 'red', yellow = 'yellow';

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
              ContainerYellowWidget(
                name: yellow,
              ),
              MyWidget(name: yellow,),
              const Spacer(),
              HomeButtonWidget(
                title: 'Click',
                onTap: () {
                  updateData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateData() {
    setState(() {
      yellow = Random().nextInt(100).toString();
    });
  }
}

class MyWidget extends StatefulWidget {
  final String name;
  const MyWidget({super.key, required this.name});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (context, value, child) {
            return Text('Value: $value');
          },
        ),
        ElevatedButton(
          onPressed: () {
            counter.value += 1; // Thay đổi giá trị
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
