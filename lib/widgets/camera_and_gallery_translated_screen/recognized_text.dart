import 'package:flutter/material.dart';

class RecognizedText extends StatelessWidget {
  const RecognizedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("recognized text"),
              Icon(Icons.arrow_downward),
            ],
          ),

          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
                border: InputBorder.none
            ),

          )
        ],
      ),
    );
  }
}
