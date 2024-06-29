import 'package:flutter/material.dart';

class SelectLook extends StatefulWidget {
  String dropdownButtonValue;
  List<String> dropdownButtonItems;

  SelectLook({
    required this.dropdownButtonValue,
    required this.dropdownButtonItems,
    super.key,
  });

  @override
  State<SelectLook> createState() => _SelectLookState();
}

class _SelectLookState extends State<SelectLook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButton(
            value: widget.dropdownButtonValue,
            items: widget.dropdownButtonItems.map((String val){
              return DropdownMenuItem(
                value: val,
                child: Row(
                  children: [
                    Icon(Icons.language), Text(val),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? look){
            },
          ),
        ],
      ),
    );
  }
}