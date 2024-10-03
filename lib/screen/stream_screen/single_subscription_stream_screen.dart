import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/models/stream_model/counter_stream_controller.dart';
import 'package:trainning/widget/home_button_widget.dart';

class SingleSubscriptionStreamScreen extends StatefulWidget {
  const SingleSubscriptionStreamScreen({super.key});

  @override
  State<SingleSubscriptionStreamScreen> createState() => _SingleSubscriptionStreamScreenState();
}

class _SingleSubscriptionStreamScreenState extends State<SingleSubscriptionStreamScreen> {
  late CounterStreamController counterStreamController;

  @override
  void initState() {
    counterStreamController = CounterStreamController.init();

    //region listen

    counterStreamController.streamController.stream.listen((event) {
      print(event);
    });

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
              stream: counterStreamController.getStream,
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
            const SizedBox(height: 100,width: 100,),
              Container(height: 100,width: 100,)

          ],
        ),
      ),
    );
  }

}
