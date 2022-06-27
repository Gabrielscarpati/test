import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'prestadorDeServicoButton.dart';
import 'usuarioButton.dart';


class BodyVeryFirstScreen extends StatefulWidget {
  const BodyVeryFirstScreen({Key? key}) : super(key: key);

  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<BodyVeryFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade500,
                  Colors.blue.shade400,
                ]
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child:SizedBox(
                  height: 180,
                  width: 180,
                  child:  CircleAvatar(
                      backgroundImage: AssetImage('assets/Logo.jpeg'),
                      radius: 1,
                    ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(48),
                    child: Column(
                      children: [

                        Text('Escolha uma opção?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 60,),
                        // #email, #password
                        Container(

                          child: Column(
                            children: [//click on the one that most fits yoy
                              Container(
                                child: PrestadorDeServicoButton(),
                              ),
                              SizedBox(height: 2,),
                              Text('Eu quero prestar serviços e ganhar dinheiro!', style: TextStyle(fontSize: 12),),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: UsuarioButton(),
                              ),
                              SizedBox(height: 2,),
                              Text('Eu quero contratar alguém!', style: TextStyle(fontSize: 12),),

                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}