import 'package:flutter/material.dart';

class TranslateInput extends StatefulWidget {
  String label;
  String translateInputText;
  TextStyle textStyleTranslateInput;
  Color color;
  Color borderColor;
  String selectLanguageValue;
  List<String> selectLanguageItems;
  Function(String) onLanguageChanged;

  TranslateInput({
    super.key,
    required this.label,
    required this.translateInputText,
    required this.textStyleTranslateInput,
    required this.color,
    required this.borderColor,
    required this.selectLanguageValue,
    required this.selectLanguageItems,
    required this.onLanguageChanged,
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
                      children: [const Icon(Icons.language), Text(val)],
                    ),
                  );
                }).toList(),
                onChanged: (String? val){widget.onLanguageChanged(val!);},
              ),

              Text(
                widget.label,
                style: widget.textStyleTranslateInput,
              )
            ],
          ),

          Expanded(
              child: ListView(
                  children: [
                    Text(widget.translateInputText),
                  ]
              )
          ),
        ],
      ),
    );
  }
}
