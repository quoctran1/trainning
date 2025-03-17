import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigController {
  late final StreamSubscription<RemoteConfigUpdate> configChangedStream;

  RemoteConfigController._() : remoteConfig = FirebaseRemoteConfig.instance;

  static RemoteConfigController? _instance;

  factory RemoteConfigController() => _instance ??= RemoteConfigController._();

  final FirebaseRemoteConfig remoteConfig;
  String? localVersion;

  FirebaseRemoteConfig get getInstance => remoteConfig;

  Future<void> initialize() async {
    try {
      await remoteConfig.fetchAndActivate();
    } catch (_) {}
  }

  void setListener() {
    configChangedStream = remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.fetchAndActivate();
    }, onError: (object) {});
  }

  void dispose() {
    configChangedStream.cancel();
  }

  bool isForceUpdate() {
    try {
      return remoteConfig.getBool('force_update');
    } catch (e) {
      return false;
    }
  }
}
