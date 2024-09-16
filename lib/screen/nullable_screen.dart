import 'package:flutter/material.dart';

class NullableScreen extends StatefulWidget {
  const NullableScreen({super.key });

  @override
  State<NullableScreen> createState() => _NullableScreenState();
}

class _NullableScreenState extends State<NullableScreen> {
  int? firstNumber;
  int? secondNumber;
  double? myDouble = 3.14159265;
  bool? myBool = true;
  String? myString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(myString ?? "Unknown user"),
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
            Text("Sum: ${getValue(firstNumber, secondNumber)}"),
            const SizedBox(
              height: 8,
            ),

          ],
        ),
      ),
    );
  }

  int getValue(int? a, int? b) {

    return (a ?? 0) + (b ?? 0);
    // return a!+b!;
  }

}
