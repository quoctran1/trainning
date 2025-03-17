
import 'package:flutter/material.dart';
import 'package:trainning/screen/tab_screen/inherited_tab_controller.dart';
import 'package:trainning/screen/tab_screen/tab_screen.dart';

class ListTextScreen extends StatefulWidget {
  final String title;
  final int index;

  const ListTextScreen({super.key, required this.title, required this.index});

  @override
  State<ListTextScreen> createState() => _ListTextScreenState();
}

class _ListTextScreenState extends State<ListTextScreen>
    with AutomaticKeepAliveClientMixin {
  List<InsertData> data = [];
  late InheritedTabController inheritedTabController;

  @override
  void didChangeDependencies() {
    inheritedTabController = InheritedTabController.of(context)!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder(
      valueListenable: inheritedTabController.valueNotifier,
      builder: (BuildContext context, InsertData? value, Widget? child) {
        addData(value);
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return data[index].buildItem();
          },
        );
      },
    );
  }

  void addData(InsertData? value) {
    if (value == null) return;
    if (value.index != widget.index) return;

    data.add(value);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
