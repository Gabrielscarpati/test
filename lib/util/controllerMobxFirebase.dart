import 'package:mobx/mobx.dart';
part 'controllerMobxFirebase.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

    @observable
    String name = '';

    @observable
    String phone = '';

    @observable
    String workingHours = '';

    @observable
    String description = '';

    @observable
    String profilePicture = '';

    @observable
    String comentarios = '';


    @action
    changeName(String newName){
        print(newName);
        print('-'*50);
        name = newName;
    }

    @action
    changePhoneNumber(String NewPhoneNumber){
        phone = NewPhoneNumber;
    }

    @action

    changeWorkingHours(String NewWorkingHours){
        workingHours = NewWorkingHours;
    }
    @action

    changeDescription(String NewDescription){
        description = NewDescription;
    }

    @action
    changeProfilePicture(String NewProfilePicture){
        profilePicture = NewProfilePicture;
    }
    @action
    changeComentarios(String NewComentarios){
        comentarios = NewComentarios;
    }
}