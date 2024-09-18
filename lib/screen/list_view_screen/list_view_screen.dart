
import 'package:flutter/material.dart';


class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> list = List.generate(60, (index) => index.toString());
  ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: 300,
          ),
          ListView(
            shrinkWrap: true,
            primary: false,
            // physics: const AlwaysScrollableScrollPhysics(),
            children: [
              getItem(1),
              getItem(2),
              getItem(3),
              getItem(4),
              getItem(5),
              getItem(6),
              getItem(7),
              getItem(8),
              getItem(9),
            ],
          ),
        ],
      ),
    ));
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
