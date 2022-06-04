import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../daos/firebase/updatePrestadorFirebase.dart';
import '../../../util/libraryComponents/colors/colors.dart';

class ComentariosInfoPrestadorDeServico extends StatefulWidget {
  const ComentariosInfoPrestadorDeServico({Key? key}) : super(key: key);

  @override
  _ComentariosInfoPrestadorDeServicoState createState() => _ComentariosInfoPrestadorDeServicoState();
}

class _ComentariosInfoPrestadorDeServicoState extends State<ComentariosInfoPrestadorDeServico> {
  final TextEditingController _ComentarioController = TextEditingController();
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        titleSpacing: 0,
        // automaticallyImplyLeading: false,
        title: Text('Faça um comentário', style: TextStyle(color: Colors.white),),
        backgroundColor: ColorAppBar,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: BackgroundColorGrey,
        child: Column(
          children: [
            Container(
              width: ScreenWidth-24.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Faça um comentário sobre\neste prestador',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(12)),
                   ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _ComentarioController,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.indigoAccent,
                    decoration: InputDecoration(
                      hintText: 'Digite o seu comentário aqui',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),


           Container(
             width: ScreenWidth-24.0,
             child: Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                    elevation: 10,

                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Avalie o prestador de 1 a 5'),
                        SizedBox(height: 8,),

                        RatingBar.builder(
                          itemBuilder: (BuildContext context, int index) => Icon(
                            Icons.star,
                            color: rating != null ? Colors.amber : Colors.grey,
                          ),
                          itemCount: 5,
                          itemSize: 40.0,
                          minRating: 1,
                          updateOnDrag: true,
                          onRatingUpdate: (rating) {
                               setState(() {
                                 this.rating = rating;
                               });
                          },
                        ),
                        SizedBox(height: 8,),

                        Text('Sua nota foi $rating'),
                      ],
                    ),
                  ),
                ),
              ),

          SizedBox(height: 20,),
          ElevatedButton(
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),

              child: Container(
                constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Salvar avaliacao',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onPressed: () {
              UpdateComentarioAvaliacao updateComentarioAvaliacao = UpdateComentarioAvaliacao(
                  dataDoComentario: DateTime.now().toString(),
                  nota: rating,
                  textoComentario: _ComentarioController.text,
                  emailUsuario: 'caio@gmail.com');
              updateComentarioAvaliacao.updateComentarioAvaliacao();
              //Navigator.of(context).pop();

            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ]
        ),
      ),  // textFormField
    );
  }
}