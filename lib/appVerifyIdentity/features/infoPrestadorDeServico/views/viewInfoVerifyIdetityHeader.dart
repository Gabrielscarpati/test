import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../businessModel/businessModelVerifyIdentity.dart';

class ViewInfoVerifyIdentityHeader extends StatelessWidget {
  ViewInfoVerifyIdentityHeader({
    Key? key,
    required this.prestador,
  });

  final BusinessModelVerifyIdentity prestador;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(prestador.name,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
