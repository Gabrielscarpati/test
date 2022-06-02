import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../daos/prestadorInformation/daoPrestadorInformatio.dart';
import '../../../../daos/usuario/daoUsuario.dart';
import '../../../hub/presenterHub.dart';
import '../../selectCidades/presenterSelectCidade.dart';
import 'widgets_for_signup.dart';
import 'backArrowSingUpScreenInstitutions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io';

class BodySignUpPart2PrestadorDocumentos extends StatefulWidget {

  const BodySignUpPart2PrestadorDocumentos({Key? key,

  }) : super(key: key);
  @override
  _BodySignUpPart2PrestadorDocumentos createState() => _BodySignUpPart2PrestadorDocumentos();
}
class _BodySignUpPart2PrestadorDocumentos extends State<BodySignUpPart2PrestadorDocumentos> {

  CollectionReference users = FirebaseFirestore.instance.collection('dadosPrestador');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;



/*  Future<void> setUserCredentials() async {
    print('success');
    await users.doc('flutter1234').set({
      'name': nameController,
      'phone': phoneController,
      'workingHours': workingHoursController,
      'description': descriptionController,
      'profilePicture': 'getUrlToImageFirebase()',
      'city': 'city',
      'roles': 'roles',
      'brazilianID':'brazilianID',
      'brazilianIDPicture':'brazilianIDPicture',
    }
    );
  }*/

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }


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
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
        print('--'*30);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'FotoPerfilPrestadorServico/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination).child('FotoPerfilPrestadorServico/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occurred');
    }
  }

    Future<String> getUrlToImageFirebase() async {
    Reference ref = await storage.ref().child(basename(_photo!.path) + DateTime.now().toString());
    await ref.putFile(File(_photo!.path));
    String imageUrl = await ref.getDownloadURL();
    print(imageUrl.toString());
     return imageUrl;
  }

  final nameController = TextEditingController();
  final itemsAcceptedController = TextEditingController();
  final workingHoursController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

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
                  Text("SignUp",
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
                        Text(
                          'Click here to choose an Image',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                          ),
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
                                    child: CircleAvatar(
                                      radius: 62,
                                      backgroundColor: Colors.black,
                                      child: _photo != null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(60),
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
                                                borderRadius: BorderRadius.circular(60)),
                                                  width: 120,
                                                  height: 120,
                                                  child: Icon(
                                                    Icons.edit,
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
                                DescriptionWidget(descriptionController: descriptionController,),
                              ],
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
                              ElevatedButton(
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0)
                                  ),

                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sign Up',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                 //getUrlToImageFirebase();
                                  //setUserCredentials();
                                  print('--'*50+'1');
                                  //getUserId();

                                  await users.doc(await getUserId()).set({
                                    'name': nameController.text.trim(),
                                    'phone': phoneController.text.trim(),
                                    'workingHours': workingHoursController.text.trim(),
                                    'description': descriptionController.text.trim(),
                                    'profilePicture': await getUrlToImageFirebase(),
                                    'city': 'city',
                                    'roles': '-----11-----',
                                    'brazilianID':'brazilianID',
                                    'brazilianIDPicture':'brazilianIDPicture',
                                  }
                                  );
                                  print('--'*50+'2');

                                  final form = formKeyAuthentication.currentState!;

                                  if (form.validate()) {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => PresenterSelectCidade.presenter(),                               ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                ),
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
}