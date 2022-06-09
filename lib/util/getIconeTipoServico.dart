import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetIconeTipoServico {

  String aaa = 'aaa';
  IconData getIconeTipoServico(String aaa){
    if(aaa == 'Pintor'){
      return FontAwesomeIcons.paintRoller;
  }
  if(aaa == 'Encanador'){
      return FontAwesomeIcons.screwdriverWrench;
  }
  if(aaa == 'Limpeza de lotes'){
      return FontAwesomeIcons.snowplow;
  }
  if(aaa == 'Carpinteiro'){
      return Icons.cut;
  }
  if(aaa == 'Confeiteiro'){
      return FontAwesomeIcons.cakeCandles;
  }
  if(aaa == 'Designer gráfico'){
      return FontAwesomeIcons.pen;
  }
  if(aaa == 'Planejador de eventos'){
      return FontAwesomeIcons.book;
  }
  if(aaa == 'Caseiro'){
      return Icons.house;
  }
  if(aaa == 'Eletricista'){
      return FontAwesomeIcons.bolt;
  }
  if(aaa == 'Soldador'){
      return FontAwesomeIcons.userAstronaut;
  }
  if(aaa == 'Motorista pessoal'){
      return FontAwesomeIcons.car;
  }
  if(aaa == 'Cortador de grama'){
      return Icons.grass;
  }
  if(aaa == 'Secretária'){
      return Icons.edit_note;
  }
  if(aaa == 'Vendedor'){
      return Icons.storefront;
  }
  if(aaa == 'Comprador / importador'){
      return Icons.sell;
  }
  if(aaa == 'Instalador de piso'){
      return Icons.face;
  }
  if(aaa == 'Reparos gerais para casa'){
      return Icons.access_alarm_sharp;
  }
  if(aaa == 'Frete de pequenas distâncias'){
      return FontAwesomeIcons.truckFast;
  }
  if(aaa == 'Mudanças'){
      return FontAwesomeIcons.truckArrowRight;
  }
  if(aaa == 'Montador de móveis'){
      return Icons.chair;
  }
  if(aaa == 'Ajudante de mudanças'){
      return Icons.people;
  }
  if(aaa == 'Designer de logo'){
      return Icons.logo_dev;
  }
  if(aaa == 'Ajudante de pedreiro'){
      return Icons.code;
  }
  if(aaa == 'Fotografo'){
      return Icons.no_photography;
  }
  if(aaa == 'Instrutor fitness'){
      return Icons.close;
  }
  if(aaa == 'Professor partícular'){
      return Icons.bookmark_add_rounded;
  }
  if(aaa == 'Social media'){
      return FontAwesomeIcons.instagram;
  }
  if(aaa == 'Cuidador de idosos'){
      return Icons.elderly;
  }
    if(aaa == 'Babá'){
      return FontAwesomeIcons.baby;
  }
    if(aaa == 'Massagistas'){
      return FontAwesomeIcons.accessibleIcon;
  }
   return Icons.bolt;

  }
}