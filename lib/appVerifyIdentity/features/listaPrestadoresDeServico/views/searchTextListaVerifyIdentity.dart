import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsListaVerifyIdentity.dart';
import '../viewModelListaVerifyIdentity.dart';

class SearchTextListaVerifyIdentity extends StatelessWidget {
  final ViewModelListaVerifyIdentity viewModel;
  final ViewActionsListaVerifyIdentity viewActions;

  const SearchTextListaVerifyIdentity({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: CursorColor,
      controller: viewModel.controlerFieldPesquisa,
      onChanged: (text) {
        this.viewActions.aplicaFiltroPesquisa(this.viewModel);
      },
      decoration: new InputDecoration(
        filled: true,

        fillColor: Colors.white,
        prefixIcon: new Icon(Icons.search, color: Colors.blueAccent,),
        labelText: "Pesquisa prestador de serviço",labelStyle: TextStyle(color: Colors.blueAccent,),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: const BorderSide(
              color: Colors.blueAccent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
