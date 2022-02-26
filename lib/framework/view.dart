import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';

import 'viewModel.dart';

abstract class View<VM extends ViewModel, VA extends ViewActions> extends StatelessWidget {
  final VM? viewModel;
  final VA viewActions;

  const View({Key? key, this.viewModel, required this.viewActions}) : super(key: key);
}
