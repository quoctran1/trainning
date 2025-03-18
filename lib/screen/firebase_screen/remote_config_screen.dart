import 'package:flutter/material.dart';
import 'package:trainning/screen/firebase_screen/remote_config_controller.dart';

class RemoteConfigScreen extends StatefulWidget {
  const RemoteConfigScreen({super.key});

  @override
  State<RemoteConfigScreen> createState() => _RemoteConfigScreenState();
}

class _RemoteConfigScreenState extends State<RemoteConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder(
              initialData: RemoteConfigController().isForceUpdate().toString(),
              stream: RemoteConfigController().remoteConfig.onConfigUpdated,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();
                return Text(
                    RemoteConfigController().isForceUpdate().toString());
              })),
    );
  }

}
