
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:trainning/screen/firebase_screen/remote_config_controller.dart';

class RemoteConfigScreen extends StatefulWidget {
  const RemoteConfigScreen({super.key});

  @override
  State<RemoteConfigScreen> createState() => _RemoteConfigScreenState();
}

class _RemoteConfigScreenState extends State<RemoteConfigScreen> {
  late TMDB tmdbWithCustomLogs;

  @override
  void initState() {
    tmdbWithCustomLogs = TMDB(
      //TMDB instance
      ApiKeys('1c20f985456ba19329b96ae2541dc8e3',
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYzIwZjk4NTQ1NmJhMTkzMjliOTZhZTI1NDFkYzhlMyIsIm5iZiI6MTY5MzY2NjgwOC4wNjksInN1YiI6IjY0ZjM0ZGY4NzQ1MDdkMDBlMmJhODYwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pyb5rZvWr-MOO_jxOikCdCeK9JyMQrnCqjPIhnAvBNM'), //ApiKeys instance with your keys,
    );
    login();
    super.initState();
  }

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


  void login() async {
    try {
      // B1. Tạo requestToken
      final requestToken = await tmdbWithCustomLogs.v3.auth
          .createSessionWithLogin('beobanhbo', '3930285zx', asMap: true);
      //B2. Tạo session
      final sessionID = await tmdbWithCustomLogs.v3.auth
          .createSession(requestToken['request_token']);
      //B3. Lấy thông tin tài khoản
      final pro = await tmdbWithCustomLogs.v3.account.getDetails(sessionID);
      log(pro.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
