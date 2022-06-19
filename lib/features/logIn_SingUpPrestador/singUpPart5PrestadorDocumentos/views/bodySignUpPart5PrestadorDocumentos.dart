import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';
import 'package:projeto_treinamento/util/libraryComponents/popUps/popUpPorFavorSelecioneUmaImagem.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../daos/firebase/updatePrestadorFirebase.dart';
import '../../../../daos/prestadorInformation/daoPrestadorInformatio.dart';
import '../../../../daos/usuario/daoUsuario.dart';
import 'widgets_for_signup.dart';
import 'backArrowSingUpScreenInstitutions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io';

class BodySignUpPart5PrestadorDocumentos extends StatefulWidget{


  const BodySignUpPart5PrestadorDocumentos({Key? key,}) : super(key: key);
  @override
  _BodySignUpPart5PrestadorDocumentos createState() => _BodySignUpPart5PrestadorDocumentos();
}
class _BodySignUpPart5PrestadorDocumentos extends State<BodySignUpPart5PrestadorDocumentos> {

  CollectionReference users = FirebaseFirestore.instance.collection('dadosPrestador');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  SetPrestadorInformationCompleta informacoesPrestador = GetIt.instance<SetPrestadorInformationCompleta>();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'FotoIdentidadePrestadorServico/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination).child('FotoIdentidadePrestadorServico/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occurred');
    }
    return _photo!.path;
  }

    Future<String> getUrlToImageFirebase() async {
    Reference ref = await storage.ref().child(basename(_photo!.path) + DateTime.now().toString());
    await ref.putFile(File(_photo!.path));
    String imageUrl = await ref.getDownloadURL();
     return imageUrl.toString();
  }
  final formKeyAuthentication = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade500,
                  Colors.blue.shade400,
                ]
            )
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 34, 0, 4),
              child:
              Row(
                children: [
                  SizedBox(child:
                      BackArrowSingUpScreenInstitutions(),
                  ),
                  Text("Documentos",
                    style: TextStyle(color: Colors.white, fontSize: 32),),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Clique no lapis para escolher\numa imagem do seu RG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(
                           height: 20,
                         ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Stack(
                            children: [
                               Center(
                                  child:GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                      child: _photo != null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(0),
                                              child: Image.file(
                                                _photo!,
                                                width:250,
                                                height: 323,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            )
                                          : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius: BorderRadius.circular(0)),
                                                  width: 250,
                                                  height: 323,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    size: 40,
                                                    color: Colors.grey[600],
                                        ),
                                      ),

                                  ),
                                ),
                            ],
                          ),
                        ),
                        Form(
                          key: formKeyAuthentication,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*.02),
                        // #login
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),

                          child: Column(
                            children: [
                              RoundedLoadingButton(
                                controller: _btnController,
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue.shade900,
                                          Colors.blue.shade500,
                                          Colors.blue.shade400
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 350.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Continuar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  final form = formKeyAuthentication.currentState!;
                                  if(await uploadFile() == null){
                                    mostrarErroEmailInvalido(context);
                                  } else if (form.validate()) {
                                    await firestore.collection('dadosPrestador').doc(await getUserId()).set({
                                      'name': informacoesPrestador.name,
                                      'phone': informacoesPrestador.phone,
                                      'workingHours': informacoesPrestador.workingHours,
                                      'description': informacoesPrestador.description,
                                      'profilePicture': informacoesPrestador.profilePicture,
                                      'comentarios': informacoesPrestador.comentarios,
                                      'city': informacoesPrestador.cidades,
                                      'roles': informacoesPrestador.cidades,
                                      'numeroDeCliquesNoLigarOuWhatsApp': 0,
                                      'dataVencimentoPlano': DateTime.now(),
                                      'dataAberturaConta': DateTime.now(),
                                      'brazilianIDPicture': await getUrlToImageFirebase(),
                                      'IdPrestador': await getUserId()
                                    }
                                    );
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => PresenterHubPrestador.presenter(),));
                                  }
                                  _btnController.reset();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  Future mostrarErroEmailInvalido(context) => showDialog(
    context: context,
    builder: (context) => PopUpPorFavorSelecioneUmaFoto(),
  );
}

