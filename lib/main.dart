import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi_aplikasi_translator/providers/translate_provider.dart';
import 'package:skripsi_aplikasi_translator/screens/camera_and_gallery_translated_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/lc_translated_look1_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/lc_translated_look2_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/recognizing_screen.dart';
import 'package:skripsi_aplikasi_translator/screens/user_written_translated_screen.dart';

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
          create: (context) => TranslateProvider(),
        ),
        // BlocProvider(
        //   create: (context),
        // )
      ],
      child: MaterialApp(
        title: 'skripsi aplikasi translator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        // home: UserWrittenScreen(),
        initialRoute: "/recognizing screen",
        routes: {
          "/recognizing screen" : (BuildContext context) => const RecognizingScreen(),
          "/lc translated look1 screen" : (BuildContext context) => const LcTranslatedLook1Screen(),
          "/lc translated look2 screen" : (BuildContext context) => const LcTranslatedLook2Screen(),
          "/image translated screen" : (BuildContext context) =>  CameraAndGalleryTranslatedScreen(),
          "/user written translated screen" : (BuildContext context) => const UserWrittenScreen(),
          // "/" (BuildContext context) =>
        },
      ),
    );
  }
}