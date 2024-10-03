import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trainning/widget/home_button_widget.dart';

class BehaviourSubjectScreen extends StatefulWidget {
  const BehaviourSubjectScreen({super.key});

  @override
  State<BehaviourSubjectScreen> createState() => _BehaviourSubjectScreenState();
}

class _BehaviourSubjectScreenState extends State<BehaviourSubjectScreen> {
  final BehaviorSubject<int> subject = BehaviorSubject<int>.seeded(0);

  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeButtonWidget(
                title: 'callSubject',
                onTap: () {
                  callSubject();
                })
          ],
        ),
      ),
    );
  }

  void callSubject() {
    // Add a listener
    subject.listen((a) => print("listener 1 : $a"));

    subject.add(1);
    subject.add(2);

    subject.listen((a) => print("listener 2 : $a"));

    subject.add(3);

    subject.listen((a) => print("listener 3 : $a"));

    subject.add(4);

  }
  /*
+─────────────+───────────────────────────────────────────────────────────────────────────────+──────────────────+
| action      | microtasks                                                                    | prints           |
+─────────────+───────────────────────────────────────────────────────────────────────────────+──────────────────+
| `listen` 1  | M1:L1[0]                                                                      |                  |
| `add(1)`    | M1:L1[0],M2:L1[1]                                                             |                  |
| `add(2)`    | M1:L1[0],M2:L1[1, 2]                                                          |                  |
| `listen` 2  | M1:L1[0],M2:L1[1, 2],M3:L2[2]                                                 |                  |
| `add(3)`    | M1:L1[0],M2:L1[1,2,3],M3:L2[2],M4:L2[3]                                       |                  |
| `listen` 3  | M1:L1[0],M2:L1[1,2,3],M3:L2[2],M4:L2[3],M5:L3[3]                              |                  |
| `add(4)`    | M1:L1[0],M2:L1[1,2,3,4],M3:L2[2],M4:L2[3,4],M5:L3[3],M6:L3[4]                 |                  |
| `close`     | M1:L1[0],M2:L1[1,2,3,4,DONE],M3:L2[2],M4:L2[3,4,DONE],M5:L3[3],M6:L3[4,DONE]  |                  |

| microtask   | M2:L1[1,2,3,4,DONE],M3:L2[2],M4:L2[3,4,DONE],M5:L3[3],M6:L3[4,DONE]           | `listener 1: 0`  |
| microtask   | M3:L2[2],M4:L2[3,4,DONE],M5:L3[3],M6:L3[4,DONE],M7:L1[2,3,4,DONE]             | `listener 1: 1`  |
| microtask   | M4:L2[3,4,DONE],M5:L3[3],M6:L3[4,DONE],M7:L1[2,3,4,DONE]                      | `listener 2: 2`  |
| microtask   | M5:L3[3],M6:L3[4,DONE],M7:L1[2,3,4,DONE],M8:L2[4,DONE],                       | `listener 2: 3`  |
| microtask   | M6:L3[4,DONE],M7:L1[2,3,4,DONE],M8:L2[4,DONE],                                | `listener 3: 3`  |
| microtask   | M7:L1[2,3,4,DONE],M8:L2[4,DONE],M9:L3[DONE]                                   | `listener 3: 4`  |
| microtask   | M8:L2[4,DONE],M9:L3[DONE],M10:L1[3,4,DONE]                                    | `listener 1: 2`  |
| microtask   | M9:L3[DONE],M10:L1[3,4,DONE],M11:L2[DONE]                                     | `listener 2: 4`  |
| microtask   | M10:L1[3,4,DONE],M11:L2[DONE]                                                 |                  |
| microtask   | M11:L2[DONE],M12:L1[4,DONE]                                                   | `listener 1: 3   |
| microtask   | M12:L1[4,DONE]                                                                |                  |
| microtask   | M13:L1[DONE]                                                                  | `listener 1: 4   |
| microtask   |                                                                               |                  |
+─────────────+───────────────────────────────────────────────────────────────────────────────+──────────────────+*/
}
