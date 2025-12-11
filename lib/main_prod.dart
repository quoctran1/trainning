import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trainning/main.dart';
import 'package:trainning/screen/firebase_screen/remote_config_controller.dart';
import 'package:trainning/utils/flavor_configs.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.wait([
      Firebase.initializeApp(),
    ]);
    await RemoteConfigController().initialize();

    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = (errorDetails) {
      FlutterError.presentError(errorDetails);
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    FlavorConfig(flavor: Flavor.prod);
    runApp(const MyApp());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
