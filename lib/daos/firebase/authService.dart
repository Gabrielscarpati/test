
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



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

/*  Future<User?> loginUser (String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e){
     // ScaffoldMessenger.of(context).showSnackBar(snackBar)
    } catch (e) {

    }
  }*/

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
      return await firebaseAuth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}



