import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../businessModels/businessModelPrestadorInfomation.dart';

class TestAddToFirebase extends StatelessWidget {
  final BusinessModelPrestadorInformation? business;

  TestAddToFirebase({Key? key, required this.business}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async{
                    print(business?.primeiroNome());

                  },
                  child: Text('Add data to firestore')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
