import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/data/page_routes.dart';
import 'package:skripsi_aplikasi_translator/screens/lc_translated_look1_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/recognizing_screen.dart';

void main() {
  runApp(const SkripsiAplikasiTranslator());
}

class SkripsiAplikasiTranslator extends StatelessWidget {
  const SkripsiAplikasiTranslator({super.key});

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
          // colorScheme: ColorScheme.dark(),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        routes: pageRoutes,
    );
  }
}