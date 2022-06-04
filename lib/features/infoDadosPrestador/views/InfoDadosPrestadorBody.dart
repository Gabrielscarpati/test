import 'package:flutter/cupertino.dart';
import '../viewActionsInfoDadosPrestador.dart';
import '../viewModelInfoDadosPrestador.dart';
import 'headerInfoDadosPrestador.dart';

class InfoDadosPrestadorBody extends StatelessWidget {
  const InfoDadosPrestadorBody({Key? key, required this.viewModel, required this.viewActions}) : super(key: key);

  final ViewModelInfoDadosPrestador viewModel;
  final ViewActionsInfoDadosPrestador viewActions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderInfoDadosPrestador(viewModel: viewModel, viewActions: viewActions),
        ],
      ),
    );
  }
}
