import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EscolhaFormaPagamento extends StatelessWidget {
  const EscolhaFormaPagamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Esolha sua forma de pagamento',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
               )
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: screenWidth/4,
                height:screenWidth/4 ,
                child: InkWell(
                  onTap: () {
                  },
                    child: Container(

                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                        child: Center(
                            child: SizedBox(
                              height: screenWidth/16,
                              child: Image.asset('assets/imagePicPay.png'),
                          )
                        )
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: screenWidth/4,
                height:screenWidth/4 ,
                child: InkWell(
                  onTap: () {
                  },
                  child: Container(

                    child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                        child: Center(
                            child: SizedBox(
                              height: screenWidth/16,
                              child: Text('Pix', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), ),
                            )
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth/4,
                height:screenWidth/4 ,
                child: InkWell(
                  onTap: () {
                  },
                  child: Container(

                    child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                        child: Center(
                              child: SizedBox(
                                height: screenWidth/16,
                                child: Icon(FontAwesomeIcons.creditCard,),
                            )
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
