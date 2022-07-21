import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../daos/firebase/authService.dart';
import '../../../../daos/firebase/updatePrestadorFirebase.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../util/libraryComponents/popUps/popUpPorFavorSelecioneUmaImagem.dart';
import '../../selectCidades/presenterSelectCidade.dart';
import 'widgets_for_signup.dart';
import 'backArrowSignUpPart2WorkerInformation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io';
import 'package:get_it/get_it.dart';


class BodySignUpPart2WorkerInformation extends StatefulWidget {


  const BodySignUpPart2WorkerInformation({
    Key? key,
  }) : super(key: key);
  @override
  _BodySignUpPart2WorkerInformation createState() => _BodySignUpPart2WorkerInformation();
}

class _BodySignUpPart2WorkerInformation extends State<BodySignUpPart2WorkerInformation> {


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


  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {}
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {}
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'FotoPerfilPrestadorServico/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('FotoPerfilPrestadorServico/');
      await ref.putFile(_photo!);
    } catch (e) {}
    return _photo!.path;
  }

  Future<String> getUrlToImageFirebase() async {
    Reference ref = await storage
        .ref()
        .child(basename(_photo!.path) + DateTime.now().toString());
    await ref.putFile(File(_photo!.path));
    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }

  final nameController = TextEditingController();
  final itemsAcceptedController = TextEditingController();
  final workingHoursController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

  final formKeyAuthentication = GlobalKey<FormState>();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  List listaComentarios = [];


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecorationColorGradient(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 34, 0, 4),
              child: Row(
                children: [
                  SizedBox(
                    child: BackArrowSignUpPart2WorkerInformation(),
                  ),
                  Text(
                    "Complete com seus dados",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(
                      children: [
                        Text(
                          'Clique aqui para escolher uma\nimagem de perfil',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Stack(
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 62,
                                    backgroundColor: Colors.indigo,
                                    child: _photo != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(120),
                                            child: Image.file(
                                              _photo!,
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(120)),
                                            width: 120,
                                            height: 120,
                                            child: Icon(
                                              Icons.photo_camera,
                                              size: 35,
                                              color: Colors.grey[800],
                                            ),
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
                            child: Column(
                              children: [
                                NameWidget(nameController: nameController),
                                PhoneWidget(phoneController: phoneController),
                                WorkingHoursWidget(workingHoursController: workingHoursController,),
                                DescriptionWidget(
                                  descriptionController: descriptionController,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * .02),
                        // #login
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            children: [

                              RoundedLoadingButton(
                                controller: _btnController,
                                child: Ink(
                                  decoration: BoxDecorationColorGradientButton(context),
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
                                  if( await uploadFile() == null ){
                                   popUpPorFavorSelecioneUmaFoto(context);

                                  }else if (form.validate()) {
                                    informacoesPrestador.comentarios = listaComentarios;
                                    informacoesPrestador.name = nameController.text;
                                    informacoesPrestador.phone = phoneController.text;
                                    informacoesPrestador.profilePicture = await getUrlToImageFirebase();
                                    informacoesPrestador.workingHours = workingHoursController.text;
                                    informacoesPrestador.description = descriptionController.text;
                                    informacoesPrestador.planoPrestador = 0;


                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return PresenterSelectCidade.presenter();
                                          },
                                        )
                                    );
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

  Future popUpPorFavorSelecioneUmaFoto(context) => showDialog(
    context: context,
    builder: (context) => PopUpPorFavorSelecioneUmaFoto(),
  );
}



