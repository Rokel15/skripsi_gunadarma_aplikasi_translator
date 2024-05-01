import 'package:flutter/material.dart';

class RecognizingScreen extends StatefulWidget {
  const RecognizingScreen({super.key});

  @override
  State<RecognizingScreen> createState() => _RecognizingScreenState();
}

class _RecognizingScreenState extends State<RecognizingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("center"),
      ),
    );
  }
}
