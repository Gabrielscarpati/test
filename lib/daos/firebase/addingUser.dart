import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class addPrestadorToFirebase{
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


class UpdatePrestadorFirebase{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final List<String> cidades;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updatePrestadorInformation() async {
    print('-'*50);
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'city': cidades,
      }
    );
  }

  UpdatePrestadorFirebase({ required this.cidades}){
    this.cidades;
}
  }