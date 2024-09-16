import 'package:flutter/material.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialScreen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialScreen'),
        ),
        body:   Center(
          child: Column(
            children: [
              Text('Hello World'),
              ElevatedButton(
                
                onPressed: () {},
                child: const Text('Enabled'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
