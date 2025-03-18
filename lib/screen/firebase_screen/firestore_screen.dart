import 'package:flutter/material.dart';
import 'package:trainning/models/app_info/app_info.dart';
import 'package:trainning/screen/firebase_screen/firestore_controller.dart';
import 'package:trainning/widget/home_button_widget.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: FireStoreController().fetchCommunity(),
              builder:
                  (BuildContext context, AsyncSnapshot<AppInfo?> snapshot) {
                if (!snapshot.hasData) return const SizedBox();
                return Text(snapshot.data!.info?.name ?? "");
              },
            ),
            HomeButtonWidget(
                title: 'Add Collection',
                onTap: () {
                  FireStoreController().addCollection();
                }),
            HomeButtonWidget(
                title: 'Search',
                onTap: () {
                  FireStoreController().searchDocument('b');
                }),
            HomeButtonWidget(
                title: 'updateDocument',
                onTap: () {
                  FireStoreController().updateDocument();
                }),
            HomeButtonWidget(
                title: 'deleteDocument',
                onTap: () {
                  FireStoreController().deleteDocument();
                }),
          ],
        ),
      ),
    );
  }
}
