import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/providers/translate_provider.dart';
import 'package:skripsi_aplikasi_translator/widgets/camera_and_gallery_translated_screen/text_is_recognized.dart';
import 'package:skripsi_aplikasi_translator/widgets/camera_and_gallery_translated_screen/text_is_translated.dart';

class CameraAndGalleryTranslatedScreen extends StatefulWidget {

  CameraAndGalleryTranslatedScreen({
    super.key,
  });

  @override
  State<CameraAndGalleryTranslatedScreen> createState() => _CameraAndGalleryTranslatedScreenState();
}

class _CameraAndGalleryTranslatedScreenState extends State<CameraAndGalleryTranslatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateProvider>(
      builder: (context, translateProvider, child){
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop){
            translateProvider.backToRecognizingScreen(context);
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(),
            ),
            body: ListView(
              children: [
                const SizedBox(height: 14,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*4.8/10,
                    margin: EdgeInsets.symmetric(horizontal: 46),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: translateProvider.image!=null?
                    Image.file(
                      translateProvider.image!,
                      fit: BoxFit.fill,
                    ) :
                    Icon(Icons.find_in_page),
                  ),
                ),

                const SizedBox(height: 36,),

                translateProvider.translatedIsBelow==true?
                Column(
                  children: [
                    TextIsRecognized(
                      //recognizedTextColor: Color(0xff6F61C0),
                      recognizedTextColor: Color(0xff4C4C6D),
                      headerText: translateProvider.headerRecognizedText,
                      icon: translateProvider.translatedIsBelow==true? translateProvider.arrowDownwardIcon:translateProvider.arrowUpwardIcon,
                      onTapIcon: (){translateProvider.onTextPositionChanged();},
                      textIsRecognized: translateProvider.textIsRecognized,
                    ),

                    SizedBox(height: 30,),

                    TextIsTranslated(
                      // recognizedTextColor: Color(0xff6F61C0),
                      translatedTextColor: Color(0xff4C4C6D),
                      headerText: translateProvider.headerTranslatedText,
                      icon: translateProvider.translatedIsBelow==true? translateProvider.arrowUpwardIcon:translateProvider.arrowDownwardIcon,
                      onTapIcon: (){translateProvider.onTextPositionChanged();},
                      translatedText: translateProvider.textIsTranslated,
                    )
                  ],
                ) :
                Column(
                  children: [
                    TextIsTranslated(
                      // recognizedTextColor: Color(0xff6F61C0),
                      translatedTextColor: Color(0xff4C4C6D),
                      headerText: translateProvider.headerTranslatedText,
                      icon: translateProvider.translatedIsBelow==true? translateProvider.arrowUpwardIcon:translateProvider.arrowDownwardIcon,
                      onTapIcon: (){translateProvider.onTextPositionChanged();},
                      translatedText: translateProvider.textIsTranslated,
                    ),

                    const SizedBox(height: 30,),

                    TextIsRecognized(
                      //recognizedTextColor: Color(0xff6F61C0),
                      recognizedTextColor: Color(0xff4C4C6D),
                      headerText: translateProvider.headerRecognizedText,
                      icon: translateProvider.translatedIsBelow==true? translateProvider.arrowDownwardIcon:translateProvider.arrowUpwardIcon,
                      onTapIcon: (){translateProvider.onTextPositionChanged();},
                      textIsRecognized: translateProvider.textIsRecognized,
                    ),
                  ],
                ),

                const SizedBox(height: 30,),
              ],
            ),
          ),

        );
      }
    );
  }
}