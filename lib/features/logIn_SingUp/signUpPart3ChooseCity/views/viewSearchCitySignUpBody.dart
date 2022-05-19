import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../util/libraryComponents/colors/colors.dart';
import 'listChangeCity1.dart';

class ViewSearchCitySignUpBody extends StatelessWidget {
  const ViewSearchCitySignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(

        children: [
          SizedBox(height: 120,),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListChangeCity()
                    ),
        ],
    );
  }
}


