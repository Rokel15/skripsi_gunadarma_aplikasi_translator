import 'package:flutter/material.dart';

class LcTranslatedLook2Screen extends StatefulWidget {
  const LcTranslatedLook2Screen({super.key});

  @override
  State<LcTranslatedLook2Screen> createState() =>
      _LcTranslatedLook2ScreenState();
}

class _LcTranslatedLook2ScreenState extends State<LcTranslatedLook2Screen> {
  List<String> looks = ["look1", "look2"];
  String selectLook = "look1";

  void onLookChanged(String? look) {
    setState(() {
      selectLook = look!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: selectLook,
                items: looks.map((String look) {
                  return DropdownMenuItem(
                    value: look,
                    child: Row(
                      children: [Text(look), Icon(Icons.view_agenda)],
                    ),
                  );
                }).toList(),
                onChanged: (String? look) {
                  onLookChanged(look);
                },
              )
            ],
          ),

          SizedBox(
            height: 14,
          ),

          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                margin: EdgeInsets.only(left: 26),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(25))),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                margin: EdgeInsets.only(top: 106),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(25))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
