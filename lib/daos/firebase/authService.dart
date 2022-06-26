
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Future getFacebookUser () async{
    return FirebaseAuth.instance.currentUser;
  }

  Future<String> getUserCurrentID() async{
    return await firebaseAuth.currentUser!.uid;
  }

  Future<User?> registerUser (String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e){
      print(e);
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red));
    } catch (e){
      print(e);
    }
  }


  Future<User?> loginUser (String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }



  Future signOut() async {
    try {
      if( await getFacebookUser() != null){
        print('kkkkkkkkkkk');
        await googleSignIn.disconnect();
        //await FacebookAuth.instance.logOut();
        return await firebaseAuth.signOut();
      }
      else{
        await googleSignIn.disconnect();
        print('hahahahhaha');
       return await firebaseAuth.signOut();
      }

    } catch(e){
      print(e.toString());
      return null;
    }
  }
}



