import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateCidadePrestador{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final List<String> cidades;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateCidadePrestador() async {
    print('-'*50);
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'city': cidades,
      }
    );
  }

  UpdateCidadePrestador({ required this.cidades}){
    this.cidades;
  }
}


class UpdateServicoPrestador{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final List<String> servicos;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateServicosPrestador() async {
    print('-'*50);
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'roles': servicos,
    }
    );
  }

  UpdateServicoPrestador({ required this.servicos}){
    this.servicos;
  }
}




class UpdateIdentidadePrestador{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String identidade;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateIdentidadePrestador() async {
    print('-'*50);
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'brazilianIDPicture': identidade,
    }
    );
  }

  UpdateIdentidadePrestador({ required this.identidade}){
    this.identidade;
  }
}