import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/screen/tab_screen/inherited_tab_controller.dart';
import 'package:trainning/screen/tab_screen/tab_screen.dart';

class GeneralTabScreen extends StatefulWidget {
  const GeneralTabScreen({super.key});

  @override
  State<GeneralTabScreen> createState() => _GeneralTabScreenState();
}

class _GeneralTabScreenState extends State<GeneralTabScreen> {
  late TextEditingController textEditingController;
  late TextEditingController indexEditingController;
  late ValueNotifier<InsertData?> valueNotifier;
  late Timer timer;

  @override
  void initState() {
    indexEditingController = TextEditingController();
    textEditingController = TextEditingController();
    valueNotifier = ValueNotifier(null);
    valueNotifier.addListener(() {
      print(valueNotifier.value?.title);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    valueNotifier.dispose();
    indexEditingController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InheritedTabController(
          valueNotifier: valueNotifier,
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
              ),
              TextField(
                controller: indexEditingController,
              ),
              TextButton(
                  onPressed: () {
                    // setState(() {});
                    timerAdd();
                    // valueNotifier.value = InsertData(textEditingController.text,
                    //     int.parse(indexEditingController.text));
                  },
                  child: const Text("ADD")),
              // Co(
              //   daw: Random.secure().nextInt(12).toString(),
              // ),
              const Expanded(child: TabScreen()),
            ],
          ),
        ),
      ),
    );
  }

  void timerAdd() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      valueNotifier.value = InsertData(
          Random.secure().nextInt(12).toString(), Random.secure().nextInt(12));
    });
  }
}

class Co extends StatefulWidget {
  final String daw;

  const Co({super.key, required this.daw});

  @override
  State<Co> createState() => _CoState();
}

class _CoState extends State<Co> {
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant Co oldWidget) {
    print('didUpdateWidget');

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.daw);
  }
}


class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final List<String> list;
   const InputWidget(
      {super.key,
      required this.textEditingController,
      required this.textEditingController1, required this.list});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        TextField(
          controller: textEditingController,
        ),
        TextField(
          controller: textEditingController1,
        ),
      ],
    );
  }
}
