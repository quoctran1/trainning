import 'package:flutter/material.dart';

class CustomListViewScreen extends StatefulWidget {
  const CustomListViewScreen({super.key});

  @override
  State<CustomListViewScreen> createState() => _CustomListViewScreenState();
}

class _CustomListViewScreenState extends State<CustomListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Text('wdwd'),
            ),
            SliverAppBar(
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'CustomScrollView',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                background: Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/043/033/254/small_2x/colored-pencils-arranged-neatly-in-a-row-photo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
