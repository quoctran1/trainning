import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trainning/screen/firebase_screen/firestore_controller.dart';
import 'package:trainning/widget/home_button_widget.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  late List<String> listWidget;

  @override
  void initState() {
    listWidget = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('app_info')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                      if (snapshot.data == null) return const SizedBox();
                      var list = snapshot.data?.docs ?? [];
                      for (var element in list) {
                        listWidget.add(element.data()['name']);
                      }
                      return ListView.builder(
                        itemCount: listWidget.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(listWidget[index]),
                          );
                        },
                      );
                    },
                  ),
                ),
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
                  onTap: () async {
                    final result = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: 'tranquoc1171@gmail.com',
                            password: 'password');
                    print(result);
                  }),
              HomeButtonWidget(
                  title: 'deleteDocument',
                  onTap: () async {
                    final result = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: 'tranquoc1171@gmail.com',
                            password: 'password');
                    print(result);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
