import 'package:email_validator/email_validator.dart';
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



class EmailWidget extends StatelessWidget {
  final TextEditingController emailController;
  const EmailWidget({Key? key, required this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (emailController) => !EmailValidator.validate(emailController!)
              ? 'Enter a valid email'
              : null,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => emailController.clear(),
            ),
            hintText: 'Enter your email address',
            labelText: 'Email',
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


class PasswordWidget extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordWidget({Key? key, required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (passwordController) {
            if (passwordController!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(passwordController)){
              return "Your password should contain Lower and upper\n case letters and a special symbol";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => passwordController.clear(),
            ),
            hintText: 'Enter your password',
            labelText: 'Password',
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


class AddressWidget extends StatelessWidget {
  final TextEditingController addressController;
  const AddressWidget({Key? key, required this.addressController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class ItemsAcceptedWidget extends StatelessWidget {
  final TextEditingController itemsAcceptedController;
  const ItemsAcceptedWidget({Key? key, required this.itemsAcceptedController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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



class CityWidget extends StatelessWidget {
  final TextEditingController cityController;
  const CityWidget({Key? key, required this.cityController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: cityController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => cityController.clear(),
            ),
            hintText: 'Enter the city where you are located',
            labelText: 'City',
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


