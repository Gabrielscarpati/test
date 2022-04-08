import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class BuildBotaoServico extends StatelessWidget {
  const BuildBotaoServico({
     Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size1 = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 1,
        bottom: kDefaultPadding * 1,
      ),
      width: 50,//size.width * 0.4,
      child: Column(
        children: <Widget>[
         Container(
           height: 100,
             width: 100,
             child:
          Image.asset(image)
         ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(1//kDefaultPadding / 10
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}