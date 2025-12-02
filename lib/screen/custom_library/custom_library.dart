import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';


class CustomLibrary extends StatefulWidget {
  const CustomLibrary({super.key});

  @override
  State<CustomLibrary> createState() => _CustomLibraryState();
}

class _CustomLibraryState extends State<CustomLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomLibrary"),
      ),
      backgroundColor: Colors.grey,
      body: TapDebouncer(
        onTap: () async {
          print('TapDebouncer');
        },
        // your tap handler moved here
        builder: (BuildContext context, TapDebouncerFunc? onTap) {
          return GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            child: const Text('Press'),
          );
        },
      ),
    );
  }

}
