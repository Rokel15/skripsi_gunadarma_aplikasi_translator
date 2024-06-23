import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/providers/translate_provider.dart';
import 'package:skripsi_aplikasi_translator/screens/camera_and_gallery_translated_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/opening_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/recognizing_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/translate_input_text_screen.dart';

late List<CameraDescription> cameras;

void main(context) async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const SkripsiAplikasiTranslator());
}

class SkripsiAplikasiTranslator extends StatelessWidget {
  const SkripsiAplikasiTranslator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TranslateProvider>(
          create: (context) => TranslateProvider()
            ..checkAndDownloadModel()
            // ..initializeCamera(),
        ),
      ],
      child: MaterialApp(
        title: 'skripsi aplikasi translator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        initialRoute: "/recognizing screen",
        routes: {
          "/opening screen" : (BuildContext context) => const OpeningScreen(),
          "/recognizing screen" : (BuildContext context) => const RecognizingScreen(),
          "/image translated screen" : (BuildContext context) =>  CameraAndGalleryTranslatedScreen(),
          "/translate input text screen" : (BuildContext context) => const TranslateInputTextScreen(),
        },
      ),
    );
  }
}