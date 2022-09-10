import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateStatusWorker {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String idPrestador;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateStatusWorker() async {
    await firestore.collection('dadosPrestador').doc(idPrestador).update({
      'identityVerified': 'yes',
    });
  }

  UpdateStatusWorker({required this.idPrestador});
}