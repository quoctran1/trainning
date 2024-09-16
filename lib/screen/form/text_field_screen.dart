import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trainning/widget/home_button_widget.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  late TextEditingController nameController, passwordController;
  late FocusNode focusName;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();

    focusName = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: nameController,
            focusNode: focusName,
            decoration:
                const InputDecoration(label: Text('Name'), hintText: 'Hint'),
            inputFormatters: [
              FilteringTextInputFormatter.allow('1'),
            ],
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              print('onchange: $value');
            },
          ),
          TextField(
            controller: passwordController,
            // keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Password'), hintText: 'Hint'),
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              print('onSubmitted: $value');
            },
          ),
          HomeButtonWidget(
              title: 'Submit',
              onTap: () {
                print('adwawdaw');
              })
        ],
      )),
    );
  }
}
