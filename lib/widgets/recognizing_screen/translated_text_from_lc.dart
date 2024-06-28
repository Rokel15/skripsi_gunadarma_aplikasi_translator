import 'package:flutter/material.dart';

class TranslatedTextFromLc extends StatelessWidget {
  String value;
  List<DropdownMenuItem<String>> items;
  Function(String val) onChanged;
  String text;
  TextStyle textStyle;

  TranslatedTextFromLc({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: const BoxDecoration(
          color: Color(0xff31363F),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: DropdownButton(
                value: value,
                items: items,
                onChanged: (String? val){onChanged(val!);},
              ),
            ),
            Text(text, style: textStyle,),
          ],
        ),
      ),
    );
  }
}