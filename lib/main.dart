import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/providers/translate_provider.dart';
import 'package:skripsi_aplikasi_translator/screens/camera_and_gallery_translated_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/lc_translated_look1_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/lc_translated_look2_screen.dart';
import 'package:camera/camera.dart';
import 'package:skripsi_aplikasi_translator/screens/recognizing_screen.dart';


late List<CameraDescription> cameras;

void main(context) async{
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.of<TranslateProvider>(context, listen: false).cameras = await availableCameras();
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
          create: (context) => TranslateProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'skripsi aplikasi translator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // colorScheme: ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: const RecognizingScreen(),
        // initialRoute: "/recognizing screen",
        // initialRoute: "/gs translated screen",
        // routes: pageRoutes,
        routes: {
          "/recognizing screen" : (BuildContext context) => RecognizingScreen(),
          "/lc translated look1 screen" : (BuildContext context) => LcTranslatedLook1Screen(),
          "/lc translated look2 screen" : (BuildContext context) => LcTranslatedLook2Screen(),
          // "/gs translated screen" : (BuildContext context) => CameraAndGalleryTranslatedScreen(),
        },
      ),
    );
  }
}