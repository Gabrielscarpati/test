import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/cadastroPrestadorDeServico/viewModelCadastroPrestadorDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'viewActionsCadastroPrestadorDeServico.dart';

class ViewCadastroPrestadorDeServico extends StatelessWidget {
  const ViewCadastroPrestadorDeServico({Key? key, required this.viewModel, required this.viewActions}) : super(key: key);

  final ViewModelCadastroPrestadorDeServico viewModel;
  final ViewActionsCadastroPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Prestador de Serviço"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nome:"),
        TextField(
          controller: viewModel.nome,
        ), // nome
        Text(""),
        Text("Telefone:"),
        TextField(
          controller: viewModel.telefone,
        ), // telefone
        TextButton(
            onPressed: () {
              RespostaProcessamento respostaProcessamento = this.viewActions.gravaValores(this.viewModel);
              if (respostaProcessamento.processamentoOK == true) {
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(respostaProcessamento.mensagemDeErro)));
              }
            },
            child: Text("Gravar"))
      ],
    );
  }
}
