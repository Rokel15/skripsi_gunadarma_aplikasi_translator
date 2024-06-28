import 'package:flutter/material.dart';

class InputAlertDialog extends StatelessWidget {
  String headAlertText;
  String bodyAlertText;
  String sourceLabel;
  String targetLabel;
  String selectSourceLanguage;
  String selectTargetLanguage;
  TextStyle headTextStyle;
  TextStyle bodyTextStyle;

  InputAlertDialog({
    super.key,
    required this.headAlertText,
    required this.bodyAlertText,
    required this.sourceLabel,
    required this.targetLabel,
    required this.selectSourceLanguage,
    required this.selectTargetLanguage,
    required this.headTextStyle,
    required this.bodyTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(headAlertText, style: headTextStyle,)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      children: [
        Material(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),

                Text(bodyAlertText, style: bodyTextStyle,),

                const SizedBox(height: 10,),

                Text("$sourceLabel : $selectSourceLanguage", style: bodyTextStyle,),

                const SizedBox(height: 6,),

                Text("$targetLabel : $selectTargetLanguage", style: bodyTextStyle,),

                const SizedBox(height: 16,),

                Center(
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical : 10),
                      padding: const EdgeInsets.only(top: 10, left: 20, right: 20 ,bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[600],
                      ),
                      child: Text(
                        'Ok',
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
