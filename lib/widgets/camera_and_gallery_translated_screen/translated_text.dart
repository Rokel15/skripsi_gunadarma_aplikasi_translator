import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslatedText extends StatelessWidget {
  Color translatedTextColor;
  String headerText;
  Icon icon;
  Function() onIconTap;
  TextEditingController translatedTextController;

  TranslatedText({
    super.key,
    required this.translatedTextColor,
    required this.headerText,
    required this.icon,
    required this.onIconTap,
    required this.translatedTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                onTap: onIconTap,
              ),
            ],
          ),

          TextFormField(
            controller: translatedTextController,
            maxLines: 4,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),

          )
        ],
      ),
    );
  }
}
