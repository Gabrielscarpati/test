import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class SelectImageFromGallery extends StatefulWidget {
  const SelectImageFromGallery({Key? key}) : super(key: key);

  @override
  _SelectImageFromGalleryState createState() => _SelectImageFromGalleryState();
}

class _SelectImageFromGalleryState extends State<SelectImageFromGallery> {

  GlobalKey _globalKey = new GlobalKey();

  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePickerGalery() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openImagePickerCamera() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select your Image'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(children: [
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
                            constraints: BoxConstraints(maxWidth: 260.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Select Image from Gallery',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      onPressed: _openImagePickerGalery,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                const SizedBox(height: 10),

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
                      constraints: BoxConstraints(maxWidth: 260.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Select Image from Camera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onPressed: _openImagePickerCamera,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),

                const SizedBox(height: 35),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey[300],
                  child: _image != null
                      ? FittedBox(child: Image.file(_image!, fit: BoxFit.contain))
                      : const Text(''),
                ),

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
                      constraints: BoxConstraints(maxWidth: 260.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Go back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print('_openImagePickerCamera');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}

/*
CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('/imageLogo.jpeg'),
        ),

constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("/backgroundImage.jpeg"),
            fit: BoxFit.cover),
      ),
      );
*/


/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class testedescobrindousuario extends StatelessWidget {
  CollectionReference listaServices = FirebaseFirestore.instance.collection('listaServices');

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      body: Center(
        child: Container(
          child:
          ElevatedButton(
                  onPressed: () async{
                DocumentSnapshot result = await listaServices.doc('1').get();
                  print(result.data());

                    },
              child: Text('Read data'),
          ),
        ),
      ),
    );
  }
}
*/
