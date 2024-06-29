import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  String label;
  TextEditingController inputTextController;
  TextStyle textStyleLabel;
  Color color;
  Color borderColor;
  String selectLanguageValue;
  List<String> selectLanguageItems;
  Function(String) onLanguageChanged;

  InputText({
    required this.label,
    required this.inputTextController,
    required this.textStyleLabel,
    required this.color,
    required this.borderColor,
    required this.selectLanguageValue,
    required this.selectLanguageItems,
    required this.onLanguageChanged,
    super.key,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, height: MediaQuery.of(context).size.height/2.4,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                onChanged: (String? language){widget.onLanguageChanged(language!);},
              ),
              
              Text(
                widget.label,
                style: widget.textStyleLabel,
              )
            ],
          ),

          Expanded(
            child: TextFormField(
              controller: widget.inputTextController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}