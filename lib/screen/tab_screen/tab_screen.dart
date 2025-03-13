import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainning/screen/tab_screen/list_text_screen.dart';
import 'package:trainning/utils/app_images/app_images.dart';

class InsertData {
  final String title;
  final int index;

  InsertData(this.title, this.index);

  Widget buildItem() {
    return const SizedBox();
  }

  static InsertData createInitData(String title, int index) {
    switch (index) {
      case 1:
        return InsertDataTab1(title);
      case 2:
        return InsertDataTab2(title);
      case 3:
        return InsertDataTab3(title);
      default:
        throw UnimplementedError();
    }
  }
}

class InsertDataTab1 extends InsertData {
  InsertDataTab1(String title) : super(title, 1);

  @override
  Widget buildItem() {
    return Text('Data $title');
  }
}

class InsertDataTab2 extends InsertData {
  InsertDataTab2(String title) : super(title, 2);

  @override
  Widget buildItem() {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.icPlusPlus,
        ),
        Text('Data $title')
      ],
    );
  }
}

class InsertDataTab3 extends InsertData {
  InsertDataTab3(String title) : super(title, 3);

  @override
  Widget buildItem() {
    List<String> list = title.split('');
    return Wrap(
      children: list.map((element) => Text("$element|")).toList(),
    );
  }
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
