import 'package:flutter/material.dart';
import 'package:trainning/widget/home_button_widget.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController nameController, passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Color colors = Colors.grey;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();

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
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          // onChanged: () {
          //   validate();
          // },
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    label: Text('Name'), hintText: 'Hint'),
                validator: (value) {
                  if ((value ?? "").length > 4) return 'Too long';
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,

              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    label: Text('Password'), hintText: 'Hint'),
                validator: (value) {
                  if ((value ?? "").length > 4) return 'Too long';
                  return null;
                },
              ),
              HomeButtonWidget(
                  title: 'Submit',
                  color: colors,
                  onTap: () {
                    validate();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void validate() {
    final result = _formKey.currentState!.validate();
    setState(() {
      colors = result ? Colors.blue : Colors.grey;
    });
  }
}
