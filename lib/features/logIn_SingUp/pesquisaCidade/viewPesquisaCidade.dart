import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/pesquisaCidade/views/viewPesquisaCidadeBody.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewPesquisaCidadeBody.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../../util/libraryComponents/colors/colors.dart';

class ViewPesquisaCidadea  {
  ViewPesquisaCidadea({
    Key? key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecione uma cidade",
        style: TextStyle(color: Colors.white),),
          backgroundColor: ColorAppBar,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _buildBody(context),

    );
  }

  _buildBody(BuildContext context) {
    if (2 == 2) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
          child: ViewPesquisaCidadeBodya(


      ));
    }
  }
}
