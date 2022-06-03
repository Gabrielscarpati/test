import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NameWidget extends StatelessWidget {

  final TextEditingController nameController;
  const NameWidget({Key? key, required this.nameController}) : super(key: key);

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
              return "Enter a valid name";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => nameController.clear(),
            ),
            hintText: 'Enter the name of your institution',
            labelText: 'Name',
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
  const PhoneWidget({Key? key, required this.phoneController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (phoneNumberController) {
            if ( phoneNumberController!.isEmpty|| phoneNumberController.length !=10  || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(phoneNumberController)){
              return "Enter a valid phone number: 9999999999";
            } else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => phoneController.clear(),
            ),
            hintText: 'Enter your phone number',
            labelText: 'Phone number',
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
  const WorkingHoursWidget({Key? key, required this.workingHoursController}) : super(key: key);

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
            hintText: '7 Am to 7 Pm',
            labelText: 'Working Hours',
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
  const DescriptionWidget({Key? key, required this.descriptionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        /*TextFormField(
              minLines: 1,
              maxLines: 5,  // allow user to enter 5 line in textfield
              keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
              controller: _Textcontroller,
            ),*/
        TextFormField(
          minLines: 1,
          maxLines: 9,
          controller: descriptionController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.next,
          validator: (nameController) {
            if (nameController!.isEmpty || nameController.length < 1) {
              return "Enter a description of at lest 50 characters. ${1 - nameController.length} left";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => descriptionController.clear(),
            ),
            hintText: 'Make a description about your job',
            labelText: 'Description about your job',
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
