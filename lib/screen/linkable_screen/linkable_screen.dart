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
  late LayerLink layerLink;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    layerLink = LayerLink();

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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        overlayEntry?.remove();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            InkWell(
              child: Container(
                color: Colors.red,
                width: 100,
                height: 30,
              ),
              onTap: () {
                if (overlayEntry == null) {
                  overlayEntry = OverlayEntry(builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        overlayEntry?.remove();
                        overlayEntry = null;
                      },
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                            color: Colors.transparent,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'awd',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    );
                  });
                  Overlay.of(context).insert(overlayEntry!);
                } else {
                  overlayEntry?.remove();
                  overlayEntry = null;
                }
              },
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Stack(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: notifier,
                          builder: (BuildContext context, Offset value,
                              Widget? child) {
                            return Positioned(
                              left: value.dx,
                              top: value.dy,
                              child: CompositedTransformTarget(
                                link: layerLink,
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
                              ),
                            );
                          },
                        ),
                        CompositedTransformFollower(
                          link: layerLink,
                          child: Column(
                            children: [
                              const Text('title'),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text('awd'),
                              ),
                              const Text('title'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
