import 'package:flutter/material.dart';
import 'package:trainning/screen/mixin_screen/screen_red.dart';
import 'package:trainning/screen/mixin_screen/screen_yellow.dart';

class MixinScreen extends StatefulWidget {
  const MixinScreen({super.key});

  @override
  State<MixinScreen> createState() => _MixinScreenState();
}

class _MixinScreenState extends State<MixinScreen>
     {
  late List<Widget> listTab;

  @override
  void initState() {
    listTab = [const ScreenRed(), const ScreenYellow()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: listTab.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size(50, 0),
              child: TabBar(
                  tabs: listTab
                      .map((e) => Tab(
                            text: e.toString(),
                          ))
                      .toList()),
            ),
          ),
          body: TabBarView(
            children: listTab,
          ),
        ));
  }


}
