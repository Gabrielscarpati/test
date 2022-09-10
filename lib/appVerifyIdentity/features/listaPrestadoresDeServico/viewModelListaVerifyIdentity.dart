import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/appVerifyIdentity/businessModel/businessModelVerifyIdentity.dart';
import 'package:projeto_treinamento/framework/viewModelLista.dart';

class ViewModelListaVerifyIdentity extends ViewModelLista<BusinessModelVerifyIdentity> {

  final TextEditingController controlerFieldPesquisa = TextEditingController();

  ViewModelListaVerifyIdentity({
    required List<BusinessModelVerifyIdentity> listaCompleta,

  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);
}
