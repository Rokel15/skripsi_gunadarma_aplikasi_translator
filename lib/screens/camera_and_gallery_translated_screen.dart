import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_aplikasi_translator/widgets/camera_and_gallery_translated_screen/recognized_text.dart';
import 'package:skripsi_aplikasi_translator/widgets/camera_and_gallery_translated_screen/translated_text.dart';

class CameraAndGalleryTranslatedScreen extends StatefulWidget {
  File image;
  String simpleText;

  CameraAndGalleryTranslatedScreen({
    super.key,
    required this.image,
    required this.simpleText,
  });

  @override
  State<CameraAndGalleryTranslatedScreen> createState() => _CameraAndGalleryTranslatedScreenState();
}

class _CameraAndGalleryTranslatedScreenState extends State<CameraAndGalleryTranslatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*1/2,
            margin: EdgeInsets.symmetric(horizontal: 46),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: widget.image!=null?
            Image.file(
              widget.image,
              fit: BoxFit.fill,
            ) :
            Icon(Icons.find_in_page),
          ),

          SizedBox(height: 40,),

          RecognizedText(),

          SizedBox(height: 36,),

          Translatedtext(),
        ],
      ),
    );
  }
}