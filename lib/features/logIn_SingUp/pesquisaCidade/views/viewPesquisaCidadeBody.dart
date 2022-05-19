import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/pesquisaCidade/views/viewHeaderPesquisaCidade.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/pesquisaCidade/views/viewListaCidades.dart';

import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../util/libraryComponents/colors/colors.dart';
import 'buttonGoSignUpScreenPart4.dart';

class ViewPesquisaCidadeBodya extends StatefulWidget {
  const ViewPesquisaCidadeBodya({Key? key}) : super(key: key);

  @override
  State<ViewPesquisaCidadeBodya> createState() => _ViewPesquisaCidadeBodyaState();
}

class _ViewPesquisaCidadeBodyaState extends State<ViewPesquisaCidadeBodya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
          title: Text('Choose city'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecorationColorGradient(context),
          )),
      body: Container(
        color: BackgroundColorGrey,
        child: Column(
          children: [
            Card(
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ViewHeaderPesquisaCidadea(),
              ),
            ),
            ViewListaCidadesa(),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ButtonGoSignUpScreenPart4(),
          ),
      ),
    );
  }
}
