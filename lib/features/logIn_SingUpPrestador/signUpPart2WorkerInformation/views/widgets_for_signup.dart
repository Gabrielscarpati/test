import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class NameWidget extends StatelessWidget {


  final TextEditingController nameController;
   NameWidget({Key? key, required this.nameController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (nameController) {
            if (nameController!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(nameController)){
              return "Digite um nome válido";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => nameController.clear(),
            ),
            hintText: 'Digite o seu nome',
            labelText: 'Nome',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneWidget extends StatelessWidget {
  final TextEditingController phoneController;
  PhoneWidget({Key? key, required this.phoneController}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (phoneNumberController) {
            if (phoneNumberController!.isEmpty|| phoneNumberController.length !=11  || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(phoneNumberController)){
              return "Digite um número válido: 27999999999";
            } else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => phoneController.clear(),
            ),
            hintText: 'Digite seu telofone (apenas números)',
            labelText: 'Número de telefone',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,

              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkingHoursWidget extends StatelessWidget {
  final TextEditingController workingHoursController;
   WorkingHoursWidget({Key? key, required this.workingHoursController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: workingHoursController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => workingHoursController.clear(),
            ),
            hintText: 'Trabalho de 7 às 18',
            labelText: 'Horas de trabalho',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class DescriptionWidget extends StatelessWidget {

  final TextEditingController descriptionController;
  DescriptionWidget({Key? key, required this.descriptionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          minLines: 1,
          maxLines: 9,
          controller: descriptionController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.next,
          validator: (nameController) {
            if (nameController!.isEmpty) {
              return "A descrição do seu serviço não pode ser nula.";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => descriptionController.clear(),
            ),
            hintText: 'Faça uma descrição do seu serviço',
            labelText: 'Descrição do seu serviço',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
