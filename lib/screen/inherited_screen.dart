import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/utils/inherited_widget/inherited_container.dart';
import 'package:trainning/widget/home_button_widget.dart';

class InheritedScreen extends StatefulWidget {
  const InheritedScreen({super.key});

  @override
  State<InheritedScreen> createState() => _InheritedScreenState();
}

class _InheritedScreenState extends State<InheritedScreen> {
  String name = '12345';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InheritedContainer(name: name, child: const NameWidget()),
        HomeButtonWidget(
          title: 'Click',
          onTap: () {
            updateData();
          },
        ),
      ],
    )));
  }

  void updateData() {
    setState(() {
      name = Random().nextInt(100).toString();
    });
  }
}

class NameWidget extends StatefulWidget {
  const NameWidget({super.key});

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late InheritedContainer inhe;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    inhe = InheritedContainer.of(context)!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      inhe.name  ,
      textAlign: TextAlign.center,
    );
  }
}
