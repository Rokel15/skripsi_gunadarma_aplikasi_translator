import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextIsTranslated extends StatelessWidget {
  Color translatedTextColor;
  String headerText;
  Icon icon;
  Function() onTapIcon;
  String translatedText;

  TextIsTranslated({
    super.key,
    required this.translatedTextColor,
    required this.headerText,
    required this.icon,
    required this.onTapIcon,
    required this.translatedText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2.8,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: translatedTextColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 2.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(headerText),
              GestureDetector(
                child: icon,
                onTap: onTapIcon,
              ),
            ],
          ),

          SizedBox(height: 6,),

          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

          ),

          SizedBox(height: 10,),

          Expanded(
            child: ListView(
              children: [
                Text(translatedText),
              ],
            ),
          )
        ],
      ),
    );
  }
}