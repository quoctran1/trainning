import 'package:flutter/material.dart';

class LateScreen extends StatefulWidget {
  const LateScreen({super.key});

  @override
  State<LateScreen> createState() => _LateScreenState();
}

class _LateScreenState extends State<LateScreen> {
  late TextEditingController textEditingController;
  late double screenSize;
  bool show = false;

  @override
  void initState() {
    textEditingController = TextEditingController();

    super.initState();
  }
  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.sizeOf(context).width;

    super.didChangeDependencies();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: "Input", label: Text('TextField')),
              controller: textEditingController,
            ),
            GestureDetector(
              onTap: () {
                setState(() {

                  show = !show;
                });
              },
              child: const Text("Show screen size"),
            ),
            const SizedBox(
              height: 8,
            ),
            if (show) Text("Screen Size: $screenSize"),
          ],
        ),
      ),
    );
  }

}
