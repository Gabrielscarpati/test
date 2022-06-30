
import 'package:cloud_firestore/cloud_firestore.dart';

class GetTermos {

  CollectionReference termos = FirebaseFirestore.instance.collection('linkTermos');

   Future<String> getTermos() async{
    DocumentSnapshot snapshot = await termos.doc('linkTermos').get();
    var data = snapshot.data() as Map<String, dynamic>;
    var termosLink = data['linkTermos'];
     return termosLink;
  }

}

