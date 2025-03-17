import 'package:flutter/material.dart';
import 'package:trainning/screen/firebase_screen/remote_config_controller.dart';

class RemoteConfigScreen extends StatefulWidget {
  const RemoteConfigScreen({super.key});

  @override
  State<RemoteConfigScreen> createState() => _RemoteConfigScreenState();
}

class _RemoteConfigScreenState extends State<RemoteConfigScreen> {
  @override
  void initState() {
    RemoteConfigController().setListener();
    super.initState();
  }
  @override
  void dispose() {
    RemoteConfigController(). dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(RemoteConfigController().isForceUpdate().toString())),
    );
  }
}
