import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUser extends StatefulWidget {
  const GetUser({Key? key}) : super(key: key);

  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  @override
  Widget build(BuildContext context) {

    final FirebaseAuth auth = FirebaseAuth.instance;
     Future<String?> userId() async {
      final User? user = await auth.currentUser;
      final userId = user?.uid.toString();
      return userId;
    }

    Future<String?> getUserId() {
       return (userId().then((value){
         print(value);
        }
       ));
    }

    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              getUserId();
            },
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
          ),
        ),
      ),
    );
  }
}

/* Future<http.StreamedResponse> updateProfile(PickedFile? data) async {
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('a'));
    if(GetPlatform.isMobile && data != null){
      File _file = File(data.path);
      request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    }
    http.StreamedResponse response = await request.send();
    return response;
  }*/

/* _registerUser() async {
    try {
      final User? user =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text,
        password: passCtrl.text,
      ))
              .user;
      FirebaseFirestore.instance.collection('users').doc().set({
        'name': nameCtrl.text,
        'uid': user!.uid,
        'email': user.email,
        'isEmailVerified': user.emailVerified, // will also be false
        'photoUrl': user.photoURL, // will always be null
      });
      print("Created");
    } catch (e) {
      print(e.toString());
    }
  }*/