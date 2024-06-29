import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslateInput extends StatefulWidget {
  String label;
  TextStyle textStyleLabel;
  String translateInputText;
  TextStyle textStyleTranslateInputText;
  Color color;
  Color borderColor;
  String selectLanguageValue;
  List<String> selectLanguageItems;
  TextStyle textStyleSelectLanguage;
  Function(String) onLanguageChanged;
  Function() tapToTranslate;

  TranslateInput({
    super.key,
    required this.label,
    required this.textStyleLabel,
    required this.translateInputText,
    required this.textStyleTranslateInputText,
    required this.color,
    required this.borderColor,
    required this.selectLanguageValue,
    required this.selectLanguageItems,
    required this.textStyleSelectLanguage,
    required this.onLanguageChanged,
    required this.tapToTranslate
  });

  @override
  State<TranslateInput> createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, height: MediaQuery.of(context).size.height/2.4,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: widget.borderColor, width: 2.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: widget.selectLanguageValue,
                items: widget.selectLanguageItems.map((String val){
                  return DropdownMenuItem(
                    value: val,
                    child: Row(
                      children: [const Icon(Icons.language), Text(val, style: widget.textStyleSelectLanguage,)],
                    ),
                  );
                }).toList(),
                onChanged: (String? val){widget.onLanguageChanged(val!);},
              ),

              GestureDetector(
                child: Text(
                  widget.label,
                  style: widget.textStyleLabel,
                ),
                onTap: (){
                  widget.tapToTranslate();
                },
              )
            ],
          ),

          Expanded(
            child: ListView(
              children: [
                Text(widget.translateInputText, style: widget.textStyleTranslateInputText,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}