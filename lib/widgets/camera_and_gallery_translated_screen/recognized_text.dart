import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecognizedText extends StatelessWidget {
  Color recognizedTextColor;
  String headerText;
  Icon icon;
  Function() onIconTap;
  TextEditingController recognizedTextConttroller;

  RecognizedText({
    super.key,
    required this.recognizedTextColor,
    required this.headerText,
    required this.icon,
    required this.onIconTap,
    required this.recognizedTextConttroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: recognizedTextColor,
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
            controller: recognizedTextConttroller,
            maxLines: 4,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            enabled: false,
          )
        ],
      ),
    );
  }
}
