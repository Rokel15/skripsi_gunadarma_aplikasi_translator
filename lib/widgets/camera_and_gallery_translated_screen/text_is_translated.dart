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
      height: MediaQuery.of(context).size.height/3.4,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: translatedTextColor,
        borderRadius: BorderRadius.circular(25),
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
          
        ],
      ),
    );
  }
}
