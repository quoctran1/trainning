import 'package:flutter/material.dart';

class ListViewSeparateScreen extends StatefulWidget {
  const ListViewSeparateScreen({super.key});

  @override
  State<ListViewSeparateScreen> createState() => _ListViewSeparateScreenState();
}

class _ListViewSeparateScreenState extends State<ListViewSeparateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return getItem(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.red,
          );
        },
      ),
    );
  }

  Widget getItem(int index) {
    print('Index $index');
    return Container(
      height: 300,
      margin: const EdgeInsets.all(8),
      color: Colors.green,
      child: Text(
        'Index $index',
      ),
    ); // Container
  }
}
