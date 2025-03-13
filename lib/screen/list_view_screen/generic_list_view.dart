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
      body: ListView.builder(
        itemCount: widget.data.length,
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return widget.buildItem(index, widget.data[index]);
        },
      ),
    );
  }
}
