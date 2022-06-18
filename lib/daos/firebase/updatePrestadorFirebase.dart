import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';




class SetPrestadorInformationSignUpScreen2{
  final String name;
  final String phone;
  final String workingHours;
  final String description;
  final String profilePicture;
  final List<dynamic> comentarios;

  SetPrestadorInformationSignUpScreen2(
          this.name,
          this.phone,
          this.workingHours,
          this.description,
          this.profilePicture,
          this.comentarios,
      );

}


class SetPrestadorInformationSelectCidade extends SetPrestadorInformationSignUpScreen2{
  final String cidades;
  SetPrestadorInformationSelectCidade(
      String name,
      String phone,
      String workingHours,
      String description,
      String profilePicture,
      List<dynamic>  comentarios,
      this.cidades,

  ) : super(name,phone,workingHours,description,profilePicture,comentarios);
}

class SetPrestadorInformationSelectServico extends SetPrestadorInformationSelectCidade{
  final String servicos;
  SetPrestadorInformationSelectServico(
      String name,
      String phone,
      String workingHours,
      String description,
      String profilePicture,
      List<dynamic> comentarios,
      String cidades,
      this.servicos,
  ) : super(name,phone,workingHours,description,profilePicture,comentarios,cidades);
}


class SetPrestadorInformationDocuments extends SetPrestadorInformationSelectServico{
  final int numeroDeCliquesNoLigarOuWhatsApp;
  final DateTime dataVencimentoPlano;
  final DateTime dataAberturaConta;
  final String brazilianIDPicture;
  SetPrestadorInformationDocuments({
    required  String name,
    required  String phone,
    required  String workingHours,
    required  String description,
    required  String profilePicture,
    required  List<dynamic> comentarios,
    required  String cidades,
    required  String servicos,
    required  this.numeroDeCliquesNoLigarOuWhatsApp,
    required  this.dataVencimentoPlano,
    required  this.dataAberturaConta,
    required  this.brazilianIDPicture,
  }) : super(name,phone,workingHours,description,profilePicture,comentarios,
      cidades,servicos );

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
      'comentarios': comentarios,
      'city': cidades,
      'roles': servicos,
      'numeroDeCliquesNoLigarOuWhatsApp': numeroDeCliquesNoLigarOuWhatsApp,
      'dataVencimentoPlano': dataVencimentoPlano,
      'dataAberturaConta': dataAberturaConta,
      'brazilianIDPicture': brazilianIDPicture,
      'IdPrestador': getUserId()
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