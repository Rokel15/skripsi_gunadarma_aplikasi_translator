import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextIsRecognized extends StatelessWidget {
  Color recognizedTextColor;
  String headerText;
  Icon icon;
  Function() onTapIcon;
  String textIsRecognized;

  TextIsRecognized({
    super.key,
    required this.recognizedTextColor,
    required this.headerText,
    required this.icon,
    required this.onTapIcon,
    required this.textIsRecognized,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, height: MediaQuery.of(context).size.height/2.8,
      margin: const EdgeInsets.symmetric(horizontal: 20), padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: recognizedTextColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 2.5)
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

          const SizedBox(height: 6,),

          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
          ),

          const SizedBox(height: 10,),

          Expanded(
            child: ListView(
              children: [
                Text(textIsRecognized),
              ],
            ),
          )
        ],
      ),
    );
  }
}
