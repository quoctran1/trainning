import 'package:flutter/material.dart';

class GenericListView<T> extends StatefulWidget {
  final Widget Function(int index, T data) buildItem;
  final List<T> data;

  const GenericListView(
      {super.key, required this.buildItem, required this.data});

  @override
  State<GenericListView<T>> createState() => _GenericListViewState<T>();
}

class _GenericListViewState<T> extends State<GenericListView<T>> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.data.isEmpty
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.not_listed_location_outlined,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No data'),
                  ],
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget.data.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return widget.buildItem(index, widget.data[index]);
              },
            ),
    );
  }
}
