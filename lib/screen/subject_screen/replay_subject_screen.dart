import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trainning/widget/home_button_widget.dart';

class ReplaySubjectScreen extends StatefulWidget {
  const ReplaySubjectScreen({super.key});

  @override
  State<ReplaySubjectScreen> createState() => _ReplaySubjectScreenState();
}

class _ReplaySubjectScreenState extends State<ReplaySubjectScreen> {
  final ReplaySubject<int> subject = ReplaySubject<int>();

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
                }) ,HomeButtonWidget(
                title: 'values',
                onTap: () {
                  print(subject.values);
                  ;
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
    subject.close();
  }
/*
+─────────────+───────────────────────────────────────────────────────────────────────────────+──────────────────+
| action      | microtasks                                                                    | prints           |
+─────────────+───────────────────────────────────────────────────────────────────────────────+──────────────────+
| `listen` 1  | M0:L1[]                                                                       |                  |
| `add(1)`    | M0:L1[],M1:L1[1]                                                                      |                  |
| `add(2)`    | M0:L1[],M1:L1[1],M2:L1[2]                                                                    |                  |
| `listen` 2  | M0:L1[],M1:L1[1],M2:L1[2],M3:L2[1],M4:L2[2],                                                          |                  |
| `add(3)`    | M0:L1[],M1:L1[1],M2:L1[2],M3:L2[1],M4:L2[2],M5: L1[3], M6: L2[3]                                                |                  |
| `listen` 3  | M0:L1[],M1:L1[1,2,3],M2:L2[],M3:L2[1,2,3],M4:L3[1,2,3]                                         |                  |
| `add(4)`    | M0:L1[],M1:L1[1,2,3,4],M2:L2[],M3:L2[1,2,3,4],M4:L3[1,2,3,4]                                    |                  |
| `close`     | M0:L1[],M1:L1[1,2,3,4,DONE],M2:L2[],M3:L2[1,2,3,4,DONE],M4:L3[1,2,3,4,DONE]                      |                  |

| microtask   | M1:L1[1,2,3,4,DONE],M2:L2[],M3:L2[1,2,3,4,DONE],M4:L3[1,2,3,4,DONE]           | `             `  |
| microtask   | M2:L2[],M3:L2[1,2,3,4,DONE],M4:L3[1,2,3,4,DONE],M5:L1[2,3,4,DONE],            | `listener 1: 1`  |
| microtask   | M3:L2[1,2,3,4,DONE],M4:L3[1,2,3,4,DONE],M5:L1[2,3,4,DONE],                    | `             `  |
| microtask   | M4:L3[1,2,3,4,DONE],M5:L1[2,3,4,DONE], M6:L2[2,3,4,DONE]                      | `listener 2: 1`  |
| microtask   | M5:L1[2,3,4,DONE],M6:L2[4,DONE],M7:L3[DONE],                                  | `listener 3: 4`  |
| microtask   | M7:L3[DONE],M8:L1[2,3,4,DONE],M9:L2[4,DONE]                                    | `listener 1: 2`  |

| microtask   | M3:L3[1],M4:L3[2],M5:L3[3],M6:L3[4],M7:L3[DONE],M8:L1[2,3,4,DONE],M9:L2[4,DONE]| `             `  |
| microtask   | M4:L3[2],M5:L3[3],M6:L3[4],M7:L3[DONE],M8:L1[2,3,4,DONE],M9:L2[4,DONE]        | ` listener 3: 1` |
| microtask   | M5:L3[3],M6:L3[4],M7:L3[DONE],M8:L1[2,3,4,DONE],M9:L2[4,DONE]                 | ` listener 3: 2` |
| microtask   | M6:L3[4],M7:L3[DONE],M8:L1[2,3,4,DONE],M9:L2[4,DONE]                          | ` listener 3: 3` |
| microtask   | M7:L3[DONE],M8:L1[2,3,4,DONE],M9:L2[4,DONE]                                   | ` listener 3: 4` |
| microtask   | M8:L1[2,3,4,DONE],M9:L2[4,DONE],                                              | `              ` |
| microtask   | M9:L2[4,DONE],M10:L1[3,4,DONE]                                                | ` listener 1: 2` |
| microtask   | M9:L2[DONE],M10:L1[3,4,DONE]                                                  | ` listener 2: 4` |
| microtask   | M10:L1[3,4,DONE],                                                             | `             `  |
| microtask   | M10:L1[4,DONE],                                                               | ` listener 1: 3` |
| microtask   | M12:L1[DONE],                                                                 | ` listener 1: 4` |
| microtask   |                                                                               |                  |
+─────────────+───────────────────────────────────────────────────────────────────────────────+──────────────────+*/
}
