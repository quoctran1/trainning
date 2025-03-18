import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainning/models/app_info/app_info.dart';

class FireStoreController {
  Future<AppInfo?> fetchCommunity() async {
    final result = await FirebaseFirestore.instance
        .collection('app_info')
        .doc('info')
        .get();
    if (result.data() == null) return null;
    final data = AppInfo.fromJson(result.data()!);
    return data;
  }

  Future<void> addCollection() async {
    await FirebaseFirestore.instance.collection('record').add({
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'age': 25,
      'createdAt': FieldValue.serverTimestamp(),
    }).then((value) {
      print("User Added with ID: ${value.id}");
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }

  Future<void> searchDocument(String name) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('record')
          .orderBy('name')
          .startAt(['Jo']).endAt(['Jo' '\uf8ff']).get();
      for (var doc in querySnapshot.docs) {
        print(doc.data());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteDocument( ) async {
    try {
      await FirebaseFirestore.instance
          .collection('record')
          .doc('VV8JUPvA60RxytYY2Pmx')
          .delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDocument() async {
    try {
      await FirebaseFirestore.instance
          .collection('record')
          .doc('VV8JUPvA60RxytYY2Pmx')
          .update({"name": "asd"});
    } catch (e) {
      print(e);
    }
  }
}
