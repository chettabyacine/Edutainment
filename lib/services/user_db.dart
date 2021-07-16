import 'package:cloud_firestore/cloud_firestore.dart';

class UserDB {
  String uid;

  UserDB({this.uid});

  //Collection reference
  final CollectionReference userData = FirebaseFirestore.instance.collection('User Data');

  Future<void> initializeUserData(String nom) async {
    return await userData.doc(uid).set({
      'nom': nom,
      'score': 0,
    });
  }

  Future<void> updateUserScore(int score) async {
    return await userData.doc(uid).update({'score': score});
  }

  Future<void> deleteUserData() async {
    return await userData.doc(uid).delete();
  }

  dynamic getUsers() async {
    var userDocs = await userData.get();
    return userDocs.docs;
  }

  Future<int> getUserScore() async {
    final docData = await userData.doc(uid).get();
    return docData.data()['score'];
  }

  Future<String> getUserName() async {
    final docData = await userData.doc(uid).get();
    return docData.data()['nom'];
  }

}