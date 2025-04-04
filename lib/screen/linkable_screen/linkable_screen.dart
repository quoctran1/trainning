import 'package:flutter/material.dart';

class LinkableScreen extends StatefulWidget {
  const LinkableScreen({super.key});

  @override
  State<LinkableScreen> createState() => _LinkableScreenState();
}

class _LinkableScreenState extends State<LinkableScreen> {
  late CompositedTransformFollower compositedTransformFollower;
  late ValueNotifier<Offset> notifier;
  GlobalKey circleKey = GlobalKey();

  @override
  void initState() {
    notifier = ValueNotifier(Offset.zero);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (BuildContext context, Offset value, Widget? child) {
              return Positioned(
                left: value.dx,
                top: value.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    value += details.delta;
                    getCirclePosition();
                    notifier.value = value;
                  },
                  child: Container(
                    key: circleKey,
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void getCirclePosition() {
    RenderBox renderBox =
        circleKey.currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    print(offset);

  }
}
