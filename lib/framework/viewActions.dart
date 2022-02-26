import 'package:projeto_treinamento/framework/blocEvent.dart';
import 'package:projeto_treinamento/framework/pipe.dart';

abstract class ViewActions<BE extends BlocEvent> {
  final Pipe<BE> blocPipeIn;

  ViewActions(this.blocPipeIn);
}
