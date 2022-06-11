import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetIconeTipoServico {
  final String nomeIcon;
  GetIconeTipoServico({required this.nomeIcon}){
    this.nomeIcon;
  }

  IconData getIconeTipoServico(String nomeIcon){
    if(nomeIcon == 'Pintor'){
      return FontAwesomeIcons.paintRoller;
  }
  if(nomeIcon == 'Encanador'){
      return FontAwesomeIcons.screwdriverWrench;
  }
  if(nomeIcon == 'Limpeza de lotes'){
      return FontAwesomeIcons.snowplow;
  }
  if(nomeIcon == 'Carpinteiro'){
      return Icons.cut;
  }
  if(nomeIcon == 'Confeiteiro'){
      return FontAwesomeIcons.cakeCandles;
  }
  if(nomeIcon == 'Designer gráfico'){
      return FontAwesomeIcons.pen;
  }
  if(nomeIcon == 'Planejador de eventos'){
      return FontAwesomeIcons.book;
  }
  if(nomeIcon == 'Caseiro'){
      return Icons.house;
  }
  if(nomeIcon == 'Eletricista'){
      return FontAwesomeIcons.bolt;
  }
  if(nomeIcon == 'Soldador'){
      return FontAwesomeIcons.userAstronaut;
  }
  if(nomeIcon == 'Motorista pessoal'){
      return FontAwesomeIcons.car;
  }
  if(nomeIcon == 'Cortador de grama'){
      return Icons.grass;
  }
  if(nomeIcon == 'Secretária'){
      return Icons.edit_note;
  }
  if(nomeIcon == 'Vendedor'){
      return Icons.storefront;
  }
  if(nomeIcon == 'Comprador / importador'){
      return Icons.sell;
  }
  if(nomeIcon == 'Instalador de piso'){
      return Icons.face;
  }
  if(nomeIcon == 'Reparos gerais para casa'){
      return Icons.access_alarm_sharp;
  }
  if(nomeIcon == 'Frete de pequenas distâncias'){
      return FontAwesomeIcons.truckFast;
  }
  if(nomeIcon == 'Mudanças'){
      return FontAwesomeIcons.truckArrowRight;
  }
  if(nomeIcon == 'Montador de móveis'){
      return Icons.chair;
  }
  if(nomeIcon == 'Ajudante de mudanças'){
      return Icons.people;
  }
  if(nomeIcon == 'Designer de logo'){
      return Icons.logo_dev;
  }
  if(nomeIcon == 'Ajudante de pedreiro'){
      return Icons.code;
  }
  if(nomeIcon == 'Fotografo'){
      return Icons.no_photography;
  }
  if(nomeIcon == 'Instrutor fitness'){
      return Icons.close;
  }
  if(nomeIcon == 'Professor partícular'){
      return Icons.bookmark_add_rounded;
  }
  if(nomeIcon == 'Social media'){
      return FontAwesomeIcons.instagram;
  }
  if(nomeIcon == 'Cuidador de idosos'){
      return Icons.elderly;
  }
    if(nomeIcon == 'Babá'){
      return FontAwesomeIcons.baby;
  }
    if(nomeIcon == 'Massagistas'){
      return FontAwesomeIcons.accessibleIcon;
  }
   return Icons.bolt;

  }
}