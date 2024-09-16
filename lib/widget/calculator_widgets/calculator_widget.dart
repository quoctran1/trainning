import 'package:flutter/cupertino.dart';
import 'package:trainning/models/calculator/base_calculator.dart';
import 'package:trainning/widget/home_button_widget.dart';

class CalculatorWidget extends StatefulWidget {
  final BaseCalculator baseCalculator;

  const CalculatorWidget({super.key, required this.baseCalculator});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.baseCalculator.methodName),
        const SizedBox(
          height: 12,
        ),
        HomeButtonWidget(
            title: 'Submit',
            onTap: () {
              setState(() {
                widget.baseCalculator.calculateResult();
              });
            }),
        const SizedBox(
          height: 12,
        ),
        Text("Calculate result: ${widget.baseCalculator.getResult()}"),
      ],
    );
  }


}
