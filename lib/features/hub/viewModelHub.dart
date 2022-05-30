import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

import '../../businessModels/businessModelPrestadorInfomation.dart';

class ViewModelHub extends ViewModel {


  final BusinessModelUsuario usuario;
  final BusinessModelCidade cidade;
  final BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade;
  final BusinessModelUsuario? email;
  final BusinessModelUsuario? phone;
  final BusinessModelUsuario? description;
  final BusinessModelUsuario? roles;
  final BusinessModelUsuario? workingHours;
  final BusinessModelUsuario? brazilianID;
  final BusinessModelUsuario? brazilianIDpicture;


  ViewModelHub({
    required this.usuario,
    required this.cidade,
    required this.principaisTiposDeServicoCidade,
     this.email,
     this.phone,
     this.description,
     this.roles,
     this.workingHours,
     this.brazilianID,
     this.brazilianIDpicture,
  }) : super();


}