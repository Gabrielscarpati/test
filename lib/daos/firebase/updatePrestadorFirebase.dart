import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* await users.doc(await getUserId()).set({
    'name': nameController.text.trim(),
    'phone': phoneController.text.trim(),
    'workingHours':
        workingHoursController.text.trim(),
    'description':
        descriptionController.text.trim(),
    'profilePicture':
        await getUrlToImageFirebase(),
    'city': 'city',
    'roles': '-----11-----',
    'brazilianIDPicture': 'brazilianIDPicture',
    'comentarios': listaComentarios,
    'numeroDeCliquesNoLigarOuWhatsApp': 0,
    'dataVencimentoPlano': DateTime.now(),
    'dataAberturaConta': DateTime.now(),
    'IdPrestador': await getUserId(),
  });*/

class SetPrestadorInformation{
  final String? name;
  final String? phone;
  final String? workingHours;
  final String? description;
  final String? profilePicture;
  final List<String>? city;
  final List<int>? roles;
  final String? brazilianIDPicture;
  final List<dynamic>? comentarios;
  final int? numeroDeCliquesNoLigarOuWhatsApp;
  final DateTime? dataVencimentoPlano;
  final DateTime? dataAberturaConta;
  final String? IdPrestador;
  final String? identidade;

  SetPrestadorInformation({
    this.name,
    this.phone,
    this.workingHours,
    this.description,
    this.profilePicture,
    this.city,
    this.roles,
    this.brazilianIDPicture,
    this.comentarios,
    this.numeroDeCliquesNoLigarOuWhatsApp,
    this.dataVencimentoPlano,
    this.dataAberturaConta,
    this.IdPrestador,
    this.identidade,
  });

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  setPrestadorInformation() async {
    await firestore.collection('dadosPrestador').doc(await getUserId()).set({
      'name': name,
      'phone': phone,
      'workingHours': workingHours,
      'description': description,
      'profilePicture': profilePicture,
      'city': city,
      'roles': roles,
      'brazilianIDPicture': brazilianIDPicture,
      'comentarios': comentarios,
      'numeroDeCliquesNoLigarOuWhatsApp': 0,
      'dataVencimentoPlano': DateTime.now(),
      'dataAberturaConta': DateTime.now(),
      'IdPrestador': await getUserId(),
    }
    );
  }
}








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

  final List<int> servicos;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateServicosPrestador() async {
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
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'brazilianIDPicture': identidade,
    }
    );
  }

  UpdateIdentidadePrestador({ required this.identidade}){
    this.identidade;
  }
}









class UpdateComentarioAvaliacao{

  CollectionReference dadosPrestador = FirebaseFirestore.instance.collection('dadosPrestador');

  Future<List> getListaComentarios() async{
    DocumentSnapshot result = await dadosPrestador.doc('flutter123').get();
    return result.data() as List;
  }



  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String dataDoComentario;
  final double nota;
  final String textoComentario;
  final String emailUsuario;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateComentarioAvaliacao() async {
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'comentarios': {
        'data': dataDoComentario,
        'nota': nota,
        'textoComentario': textoComentario,
        'usuario': emailUsuario,
        },
      }
    );
  }

  UpdateComentarioAvaliacao({
    required this.dataDoComentario,
    required this.nota,
    required this.textoComentario,
    required this.emailUsuario,
  }){
    this.dataDoComentario;
    this.nota;
    this.textoComentario;
    this.emailUsuario;
  }
}