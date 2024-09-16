import 'package:flutter/material.dart';
import 'package:trainning/screen/form/text_field_screen.dart';

class FormContainerScreen extends StatefulWidget {
  const FormContainerScreen({super.key});

  @override
  State<FormContainerScreen> createState() => _FormContainerScreenState();
}

class _FormContainerScreenState extends State<FormContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('1234'),
            SizedBox(
              height: 40,
            ),
            Expanded(child: TextFieldScreen()),
          ],
        ),
      ),
    );
  }
}
