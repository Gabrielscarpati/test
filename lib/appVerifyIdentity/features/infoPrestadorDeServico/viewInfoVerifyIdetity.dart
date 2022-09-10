
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/infoPrestadorDeServico/views/viewInfoVerifyIdetity.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/infoPrestadorDeServico/views/viewInfoVerifyIdetityHeader.dart';
import '../../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../../businessModel/businessModelVerifyIdentity.dart';

class ViewInfoVerifyIdentity extends StatelessWidget {
  final BusinessModelVerifyIdentity prestador;
  ViewInfoVerifyIdentity({Key? key, required this.prestador,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        // automaticallyImplyLeading: false,
        title: prestador == null
              ? CircularProgressIndicator()
              : ViewInfoVerifyIdentityHeader(
          prestador: this.prestador,

              ),
        backgroundColor: ColorAppBar,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _buildBody(context),
    );
  }
  _buildBody(BuildContext context) {
    if (prestador == null) {
      return Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return Scaffold(

        body: ViewInfoVerifyIdentityBody(
          prestador: this.prestador,
        )
      );
    }
  }
}
