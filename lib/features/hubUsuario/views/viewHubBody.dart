import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/daos/firebase/authService.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubCidade.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubGridView.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubPrestador.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubServicos.dart';
import 'package:projeto_treinamento/util/libraryComponents/colors/colorGradient.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../../logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';
import '../viewActionsHub.dart';
import '../viewHub.dart';
import '../viewModelHub.dart';

class ViewHubBodyUsuario extends StatelessWidget {
  ViewHubBodyUsuario({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubUsuario viewModel;
  final ViewActionsHubUsuario viewActions;

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecorationColorGradient(context),
      child: Column(
        children: [
          ViewHubUsuarioHeader(viewModel: viewModel, viewActions: viewActions),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.blue.shade900,
                      spreadRadius: 1)
                ],
                color: BackgroundColorGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ViewHubCidade(
                          viewModel: viewModel, viewActions: viewActions),
                            SizedBox(height: 16,),
                      ViewHubServicos(
                          viewModel: viewModel, viewActions: viewActions),
                      ViewHubGridView(
                          viewModel: viewModel, viewActions: viewActions),

                          SizedBox(height: 16,),
                                      Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
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
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Deslogar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  await authService.signOut();
                                  Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (BuildContext context) {
                                      return ViewVeryFirstScreen();
                                    },
                                    ),
                                        (route)=> false,);
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
    );
  }
}
