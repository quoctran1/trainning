import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({super.key});

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                automaticallyImplyLeading: false,
                pinned: false,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      Container(color: Colors.red, height: 100),
                      Container(
                        color: Colors.yellow,
                        height: 100,
                        child: const Row(
                          children: [
                            Text('123'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const ListScreen(),
        ),
      ),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final BehaviorSubject _stream;

  @override
  void initState() {
    super.initState();
    list = List.generate(20, (index) => index.toString());

    _stream = BehaviorSubject();
    _stream.debounceTime(const Duration(milliseconds: 10)).listen(_listen);
  }

  @override
  void dispose() {
    _stream.close();
    super.dispose();
  }

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (data) {
        _stream.add(data);
        return false;
      },
      child: ListView.builder(
        itemCount: list.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return getItem(index);
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

  void _listen(event) async {
    if (event is ScrollUpdateNotification) {
      if (event.metrics.maxScrollExtent > event.metrics.minScrollExtent) {
        final willLoadMore =
            event.metrics.pixels > event.metrics.maxScrollExtent * 0.6;
        if (willLoadMore) {
          setState(() {
            list.addAll(List.generate(20, (index) => 'Item ${index + 1}'));
          });
        }
      }
    }
  }
}
