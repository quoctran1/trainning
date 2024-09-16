import 'package:flutter/material.dart';

class NonNullScreen extends StatefulWidget {
  const NonNullScreen({super.key});

  @override
  State<NonNullScreen> createState() => _NonNullScreenState();
}

class _NonNullScreenState extends State<NonNullScreen> {
  int firstNumber=1 ;
  int secondNumber = 3;
  double myDouble = 3.14159265;
  bool myBool = true;
  String myString = 'Hello, Dart!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(firstNumber.toString()),
            const SizedBox(
              height: 8,
            ),
            Text(myDouble.toString()),
            const SizedBox(
              height: 8,
            ),
            Text(myBool.toString()),
            const SizedBox(
              height: 8,
            ),
            Text(myString.toString()),
            const SizedBox(
              height: 8,
            ),
            Text("Sum: ${getValue(firstNumber, secondNumber)}"),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  int getValue(int a, int b) {
    return a + b;
  }
/*  void calculate(List<int?> listData){
    int sum=0;
    List<int?> items = [1, 2, null, 4,5,6,null];
    for (var element in listData) {
      sum+=element??0;
    }
  }
  void calculate2(List<int>? listData){
    for (var element in listData!) {

    }
  }
  void calculate3(List<int?>? listData){
    int sum=0;
    for (var element in listData!) {
      sum+=element??0;
    }
  }*/

}
