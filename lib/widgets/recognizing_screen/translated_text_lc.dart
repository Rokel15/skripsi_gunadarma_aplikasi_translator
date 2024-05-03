import 'package:flutter/material.dart';

class TranslatedTextLc extends StatelessWidget {
  Color containerColor;
  String value;
  List<String> items;
  Icon languageIcon;
  Function(String? val) onDropDownButtonChanged;
  String text;

  TranslatedTextLc({
    super.key,
    required this.containerColor,
    required this.value,
    required this.items,
    required this.languageIcon,
    required this.onDropDownButtonChanged,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20), padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: DropdownButton(
                  value:  this.value,
                  items: this.items.map((String language){
                    return DropdownMenuItem(
                      value: language,
                      child: Row(
                        children: [
                          Icon(Icons.language),
                          Text(language),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: this.onDropDownButtonChanged,
                ),
              ),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ]
        ),
      ),
    );
  }
}