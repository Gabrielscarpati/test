import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FuncaoPestadorEmailJaExisteOuNao{
  late final TextEditingController emailController;
  FuncaoPestadorEmailJaExisteOuNao({required this.emailController});

  Future checkIfEmailInUse() async {
    final emailControllerText = emailController.text;
    try {
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailControllerText);
      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } catch (error) {
      // Handle error
      // ...
      return 'kkkk';
    }
  }
}