import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RecognizeTextSign extends StatelessWidget {
  bool cameraStatus;
  String recognizingTextSign;
  TextStyle textStyle;

  RecognizeTextSign({
    super.key,
    required this.cameraStatus,
    required this.recognizingTextSign,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin:  const EdgeInsets.only(top: 20, left: 20),
        child: cameraStatus==false?
        Container() :
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [FadeAnimatedText(recognizingTextSign, textStyle: textStyle)],
        ),
      ),
    );
  }
}
