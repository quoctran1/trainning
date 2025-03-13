import 'package:flutter/material.dart';
import 'package:trainning/screen/tab_screen/inherited_tab_controller.dart';
import 'package:trainning/screen/tab_screen/list_text_screen.dart';

class InsertData {
  final String title;
  final int index;

  InsertData(this.title, this.index);
}

class TabData {
  final String title;
  final Widget widget;

  TabData(this.title, this.widget);
}

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController tabController;
  List<TabData> screen = [];

  @override
  void initState() {
    screen.addAll([
      TabData(
          'Tab 1',
          const ListTextScreen(
            title: 'Tab 1',
            index: 1,
          )),
      TabData(
          'Tab 2',
          const ListTextScreen(
            title: 'Tab 2',
            index: 2,
          )),
      TabData(
          'Tab 3',
          const ListTextScreen(
            title: 'Tab 3',
            index: 3,
          )),
      TabData(
          'Tab 4',
          const ListTextScreen(
            title: 'Tab 4',
            index: 4,
          )),
      TabData(
          'Tab 5',
          const ListTextScreen(
            title: 'Tab 5',
            index: 5,
          )),
    ]);

    tabController = TabController(length: screen.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(),
        bottom: PreferredSize(
          preferredSize: const Size(50, 0),
          child: TabBar(
              controller: tabController,
              tabs: screen
                  .map((e) => Tab(
                        text: e.title,
                      ))
                  .toList()),
        ),
      ),
      body: TabBarView(
          controller: tabController,
          children: screen.map((e) => e.widget).toList()),
    );
  }
}
