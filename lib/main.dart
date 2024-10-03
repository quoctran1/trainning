import 'package:flutter/material.dart';
import 'package:trainning/screen/bloc_screen/bloc_provider_screen.dart';
import 'package:trainning/screen/bloc_screen/bloc_screen.dart';
import 'package:trainning/screen/cupertino_screen.dart';
import 'package:trainning/screen/form/form_screen.dart';
import 'package:trainning/screen/form/text_field_screen.dart';
import 'package:trainning/screen/future_screen/future_screen.dart';
import 'package:trainning/screen/image_screen/cache_image_screen.dart';
import 'package:trainning/screen/inherited_screen.dart';
import 'package:trainning/screen/late_screen.dart';
import 'package:trainning/screen/list_view_screen/custom_list_view_screen.dart';
import 'package:trainning/screen/list_view_screen/list_view_custom_builder_screen.dart';
import 'package:trainning/screen/list_view_screen/list_view_custom_list_screen.dart';
import 'package:trainning/screen/list_view_screen/list_view_screen.dart';
import 'package:trainning/screen/list_view_screen/list_view_seperate_screen.dart';
import 'package:trainning/screen/my_profile_screen.dart';
import 'package:trainning/screen/nullable_screen.dart';
import 'package:trainning/screen/oop_screen/oop_screen.dart';
import 'package:trainning/screen/stream_screen/stream_broadcast_screen.dart';
import 'package:trainning/screen/stream_screen/single_subscription_stream_screen.dart';
import 'package:trainning/screen/subject_screen/publish_subject_screen.dart';
import 'package:trainning/screen/subject_screen/replay_subject_screen.dart';
import 'package:trainning/screen/value_notifier_screen.dart';
import 'package:trainning/widget/home_button_widget.dart';

import 'screen/expand_screen.dart';
import 'screen/form/form_container_screen.dart';
import 'screen/list_view_screen/list_view_builder_screen.dart';
import 'screen/material_screen.dart';
import 'screen/mixin_screen/mixin_screen.dart';
import 'screen/non_null_screen.dart';
import 'screen/set_state_screen.dart';
import 'screen/stream_screen/stream_screen.dart';
import 'screen/subject_screen/behaviour_subject_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Training"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeButtonWidget(
              title: 'Non-Nullable',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const NonNullScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'Nullable',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const NullableScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'Late',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LateScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'Constructor',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyProfileScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'ValueNotifierScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ValueNotifierScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'SetStateScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SetStateScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'CupertinoScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CupertinoScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'MaterialScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MaterialScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'ExpandScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ExpandScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'InheritedScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const InheritedScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'ListViewScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ListViewScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'ListViewBuilderScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ListViewBuilderScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'ListViewSeparateScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ListViewSeparateScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'ListViewCustomScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ListViewCustomBuilderScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'ListViewCustomListScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ListViewCustomListScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'CustomListViewScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const CustomListViewScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'OOPScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const OOPScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'CacheImageScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CacheImageScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'TextFieldScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const TextFieldScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'FormScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const FormScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'FormContainerScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const FormContainerScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'FutureScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const FutureScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'MixinScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MixinScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'StreamScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const StreamScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'SingleSubscriptionStreamScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const SingleSubscriptionStreamScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'StreamBroadcastScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const StreamBroadcastScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'BehaviourSubjectScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const BehaviourSubjectScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'PublishSubjectScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const PublishSubjectScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'MainSrceen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ReplaySubjectScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            HomeButtonWidget(
              title: 'BlocScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const BlocScreen(),
                  ),
                );
              },
            ),
            HomeButtonWidget(
              title: 'BlocProviderScreen',
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const BlocProviderScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
