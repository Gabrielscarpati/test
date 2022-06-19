import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FuncaoPestadorLogInEmailNaoExiste{
  late final TextEditingController emailController;
  FuncaoPestadorLogInEmailNaoExiste({required this.emailController});

  Future<bool> checkIfEmailInUse() async {
    final emailControllerText = emailController.text;
    try {
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailControllerText);
      // In case list is not empty
      if (list.isNotEmpty) {
        print('-'*50);
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        print('a'*50);
        return false;

      }
    } catch (error) {
      // Handle error
      // ...
      return true;
    }
  }
}