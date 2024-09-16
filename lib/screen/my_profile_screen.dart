import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();

    super.initState();
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
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(8),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return TextField(
                    decoration: const InputDecoration(
                        hintText: "Name", label: Text('Search name')),
                    controller: textEditingController,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Firstname: Steve')),
                      Expanded(child: Text('LastName: Job')),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Fullname: Steve Job'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Age: 30'),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Rewards: Gold medal, Sliver medal"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
