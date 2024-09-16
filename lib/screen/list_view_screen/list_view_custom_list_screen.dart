import 'package:flutter/material.dart';

class ListViewCustomListScreen extends StatefulWidget {
  const ListViewCustomListScreen({super.key});

  @override
  State<ListViewCustomListScreen> createState() => _ListViewCustomListScreenState();
}

class _ListViewCustomListScreenState extends State<ListViewCustomListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
            [
              getItem(1),
              getItem(2),
              getItem(3),
              getItem(4),
              getItem(5),
              getItem(6),
              getItem(7),
              getItem(8),
              getItem(9),
            ]
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
