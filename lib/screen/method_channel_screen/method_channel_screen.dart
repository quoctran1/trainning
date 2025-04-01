import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trainning/widget/home_button_widget.dart';

class MethodChannelScreen extends StatefulWidget {
  const MethodChannelScreen({super.key});

  @override
  State<MethodChannelScreen> createState() => _MethodChannelScreenState();
}

class _MethodChannelScreenState extends State<MethodChannelScreen> {
  late MethodChannel methodChannel;

  @override
  void initState() {
    methodChannel = const MethodChannel('com.example.trainning/method_channel');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeButtonWidget(
              title: 'Tap',
              onTap: () async {
                final result =
                    await methodChannel.invokeMethod<String>('method');
                if (result != null) {
                  print(result);
                  List<String> list = [];
                  result.split('').forEach((element) {
                    list.add(element);
                  });
                  for (var action in list) {
                    if (action.length.isEven) {
                      list.add(action);
                    }
                  }
                  emptyTextSelectionControls.hashCode.isEven
                      ? print('true')
                      : print('false');
                  final ke = widget.key.toString().toUpperCase();
                  final wid = widget.toString().toUpperCase();
                  String temp = ke + wid;
                  if (temp.length.isEven) {
                    bool check = temp.endsWith('other');
                    var checkResult = check.toString().substring(0, 1);
                    checkResult.endsWith('a') == true;
                    Queue<String> queue = Queue();
                    queue.add(checkResult);
                  }
                  for( var item in result.split('')) {
                    String temp= wid.substring(0,1);
                    temp+=item;
                    temp.toLowerCase();
                  temp.split('').reversed.toList();
                  }
                  this.widget.createElement();




                }
                methodChannel.setMethodCallHandler((call) async {});
              }),
        ],
      ),
    );
  }
}
  class  SealedClas{
  void haha(){
    print('haha');
  }
}

