import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/providers/translate_provider.dart';
import 'package:skripsi_aplikasi_translator/widgets/camera_and_gallery_translated_screen/recognized_text.dart';
import 'package:skripsi_aplikasi_translator/widgets/camera_and_gallery_translated_screen/translated_text.dart';

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
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*1/2,
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

              SizedBox(height: 40,),

              translateProvider.translatedIsBelow==true?
              Column(
                children: [
                  RecognizedText(
                    recognizedTextColor: Colors.blue,
                    headerText: translateProvider.headerRecognizedText,
                    icon: translateProvider.translatedIsBelow==true? translateProvider.arrowDownwardIcon:translateProvider.arrowUpwardIcon,
                    onIconTap: (){translateProvider.onTextPositionChanged();},
                    recognizedTextConttroller: translateProvider.recognizedTextConttroller,
                  ),

                  SizedBox(height: 36,),

                  TranslatedText(
                    translatedTextColor: Colors.blue,
                    headerText: translateProvider.headerTranslatedText,
                    icon: translateProvider.translatedIsBelow==true? translateProvider.arrowUpwardIcon:translateProvider.arrowDownwardIcon,
                    onIconTap: (){translateProvider.onTextPositionChanged();},
                    translatedTextController: translateProvider.translatedTextConttroller,
                  )
                ],
              ):
              Column(
                children: [
                  TranslatedText(
                    translatedTextColor: Colors.blue,
                    headerText: translateProvider.headerTranslatedText,
                    icon: translateProvider.translatedIsBelow==true? translateProvider.arrowUpwardIcon:translateProvider.arrowDownwardIcon,
                    onIconTap: (){translateProvider.onTextPositionChanged();},
                    translatedTextController: translateProvider.translatedTextConttroller,
                  ),

                  SizedBox(height: 36,),

                  RecognizedText(
                    recognizedTextColor: Colors.blue,
                    headerText: translateProvider.headerRecognizedText,
                    icon: translateProvider.translatedIsBelow==true? translateProvider.arrowDownwardIcon:translateProvider.arrowUpwardIcon,
                    onIconTap: (){translateProvider.onTextPositionChanged();},
                    recognizedTextConttroller: translateProvider.recognizedTextConttroller,
                  ),
                ],
              ),


            ],
          ),
        );
      }
    );
  }
}