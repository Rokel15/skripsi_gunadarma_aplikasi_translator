import 'package:flutter/material.dart';

class LcTranslatedLook1Screen extends StatefulWidget {
  const LcTranslatedLook1Screen({super.key});

  @override
  State<LcTranslatedLook1Screen> createState() => _LcTranslatedLook1ScreenState();
}

class _LcTranslatedLook1ScreenState extends State<LcTranslatedLook1Screen> {
  List<String> looks = ["look1", "look2"];
  String selectLook = "look1";

  void onLookChanged(String? look){
    setState(() {
      selectLook = look!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: selectLook,
                items: looks.map((String look){
                  return DropdownMenuItem(
                    value: look,
                    child: Row(
                      children: [
                        Text(look),
                        Icon(Icons.view_agenda)
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? look){onLookChanged(look);},)
            ],
          ),

          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/2.2,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey
            ),
          ),

          SizedBox(height: 36,),

          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/2.5,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey
            ),
          ),

        ],
      ),
    );
  }
}
