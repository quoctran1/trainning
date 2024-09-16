import 'package:flutter/material.dart';

class ListViewCustomBuilderScreen extends StatefulWidget {
  const ListViewCustomBuilderScreen({super.key});

  @override
  State<ListViewCustomBuilderScreen> createState() => _ListViewCustomBuilderScreenState();
}

class _ListViewCustomBuilderScreenState extends State<ListViewCustomBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return ListTile(title: Text('Item $index'));
          },
          childCount: 100,
        ),
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
