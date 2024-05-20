import 'package:flutter/material.dart';

class UserWrittenScreen extends StatelessWidget {
  const UserWrittenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            
          )
        ],
      ),
    );
  }
}
