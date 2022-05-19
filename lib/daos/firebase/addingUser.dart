import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addUserPart2(String title, String description, String userId) async{
    try{
      await firestore.collection('notes').add({
        'title' : title,
        'description': description,
        'date': DateTime.now(),
        'date': userId,

      });
    } catch(e){

    }
  }
}