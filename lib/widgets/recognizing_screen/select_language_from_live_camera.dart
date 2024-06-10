import 'package:flutter/material.dart';

class SelectLanguageFromLiveCamera extends StatelessWidget {
  String value;
  List<DropdownMenuItem<String>> items;
  Function(String val) onChanged;

  SelectLanguageFromLiveCamera({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(top: 8, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.black,
        ),
        child: DropdownButton(
          underline: Container(),
          value: value,
          items: items,
          onChanged: (String? val){onChanged(val!);},
        ),
      ),
    );
  }
}
