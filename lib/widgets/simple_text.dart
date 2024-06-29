import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  String simpleText;
  TextStyle textStyle;

  SimpleText({
    super.key,
    required this.simpleText,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(simpleText, style: textStyle,),
    );
  }
}