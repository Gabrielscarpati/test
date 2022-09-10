import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Icons/icone_servicos_icons.dart';


class GetIconeTipoServico {
  final String nomeIcon;
  GetIconeTipoServico({required this.nomeIcon}){
    this.nomeIcon;
  }

  IconData getIconeTipoServico(String nomeIcon){
    if(nomeIcon == 'Pintor'){
      return FontAwesomeIcons.paintRoller;
      //
    }
    if(nomeIcon == 'Encanador'){
      return FontAwesomeIcons.screwdriverWrench;
      //
    }
    if(nomeIcon == 'Limpeza de lotes'){
      return FontAwesomeIcons.snowplow;
    }
    if(nomeIcon == 'Carpinteiro'){
      return IconeServicos.xidorq01;
    }
    if(nomeIcon == 'Confeiteiro'){
      return FontAwesomeIcons.cakeCandles;
      //
    }
    if(nomeIcon == 'Designer gráfico'){
      return FontAwesomeIcons.pen;

    }
    if(nomeIcon == 'mecânico'){
      return FontAwesomeIcons.screwdriverWrench;

    }
    if(nomeIcon == 'Planejador de eventos'){
      return FontAwesomeIcons.book;
      //
    }
    if(nomeIcon == 'Caseiro'){
      return Icons.house;
      //
    }
    if(nomeIcon == 'Eletricista'){
      return Icons.electric_bolt;
      //
    }
    if(nomeIcon == 'Soldador'){
      return IconeServicos.soldador;
    }
    if(nomeIcon == 'Motorista pessoal'){
      return FontAwesomeIcons.car;
      //
    }
    if(nomeIcon == 'Cortador de grama'){
      return IconeServicos.cortador_de_grama;
    }
    if(nomeIcon == 'Secretária'){
      return Icons.edit_note;
      //
    }
    if(nomeIcon == 'Vendedor'){
      return Icons.storefront;
      //
    }
    if(nomeIcon == 'Comprador / importador'){
      return Icons.sell;
      //
    }
    if(nomeIcon == 'Instalador de piso'){
      return IconeServicos.instalador_de_piso;
    }
    if(nomeIcon == 'Reparos gerais para casa'){
      return FontAwesomeIcons.screwdriver;
    }
    if(nomeIcon == 'Frete de pequenas distâncias'){
      return FontAwesomeIcons.truckFast;
      //
    }
    if(nomeIcon == 'Mudanças'){
      return FontAwesomeIcons.truckArrowRight;
      //
    }
    if(nomeIcon == 'Montador de móveis'){
      return Icons.chair;
      //
    }
    if(nomeIcon == 'Ajudante de mudanças'){
      return IconeServicos.ajudante_de_mudanc_as;
    }
    if(nomeIcon == 'Designer de logo'){
      return Icons.logo_dev;
    }
    if(nomeIcon == 'Ajudante de pedreiro'){
      return IconeServicos.brickwall_brick_svgrepo_com;
    }
    if(nomeIcon == 'Fotografo'){
      return Icons.no_photography;
      //
    }
    if(nomeIcon == 'Instrutor fitness'){
      return IconeServicos.personaltrainer;

    }
    if(nomeIcon == 'Professor partícular'){
      return FontAwesomeIcons.personChalkboard;
      //
    }
    if(nomeIcon == 'Social media'){
      return FontAwesomeIcons.instagram;
      //
    }
    if(nomeIcon == 'Cuidador de idosos'){
      return IconeServicos.cuidadoridosos;
      //
    }
    if(nomeIcon == 'Babá'){
      return FontAwesomeIcons.baby;
      //
    }
    if(nomeIcon == 'Massagistas'){
      return  IconeServicos.massagista;
      //
    }
    return Icons.bolt;

  }
}