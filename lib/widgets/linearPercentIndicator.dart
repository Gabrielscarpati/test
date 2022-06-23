import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LienarPercentIndicatorWidget extends StatelessWidget {
  final double? rating;
  final int totalDeAvaliacoes;

  const LienarPercentIndicatorWidget({
    Key? key,
    this.rating,
    required this.totalDeAvaliacoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rating != null
        ? Container(
          child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * 0.35,
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2000,
              curve: Curves.elasticIn,
              percent: (rating!),
              center: Text(""),
              barRadius: const Radius.circular(16),
              progressColor: Color(0xff006400),
            ),
        )
        : LinearPercentIndicator(
            width: MediaQuery.of(context).size.width * 0.35,
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2000,
            percent: (0),
            center: Text("0"),
            barRadius: const Radius.circular(16),
            progressColor: Color(0xff006400),
          );
  }
}
