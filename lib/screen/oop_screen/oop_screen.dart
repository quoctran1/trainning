import 'package:flutter/material.dart';
import 'package:trainning/models/calculator/base_calculator.dart';

import '../../widget/calculator_widgets/calculator_widget.dart';

class OOPScreen extends StatefulWidget {
  const OOPScreen({super.key});

  @override
  State<OOPScreen> createState() => _OOPScreenState();
}

class _OOPScreenState extends State<OOPScreen> {
  late BaseCalculator sum,subtract;

  @override
  void initState() {
    sum = SumCalculator(methodName: 'SumCalculator');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CalculatorWidget(
              baseCalculator: sum,
            ),

          ],
        ),
      ),
    );
  }
}
