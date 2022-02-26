import 'blocEvent.dart';
import 'pipe.dart';
import 'viewModel.dart';

abstract class Bloc<VM extends ViewModel, BE extends BlocEvent> {
  Pipe<BE> pipeIn = Pipe();
  Pipe<VM> pipeOut = Pipe();

  Bloc() {
    pipeIn.receive.listen(onReceiveBlocEvent);
  }

  void onReceiveBlocEvent(BE blocEvent);

  void sendViewModelOut(VM viewModel) {
    pipeOut.send(viewModel);
  }
}

/*

    BLOC
-------------------
|                 |
|   BE()        =====  <- BE(??????)
|                 |
|                 |
|                 |
|   VM(???)  -> =====   VM()
|                 |
-------------------


-------------------
|                 |
|   BE()          <- BE(??????)
|    ?            |
|    ?            |
|    ?            |
|   VM(???)       -> VM()
|                 |
-------------------




 */
