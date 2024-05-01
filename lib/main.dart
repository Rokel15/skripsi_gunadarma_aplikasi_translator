import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/screens/recognizing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // MultiProvider(
      // providers: [],
      // child:
      MaterialApp(
        title: 'skripsi aplikasi translator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RecognizingScreen(),
      // ),
    );
  }
}



