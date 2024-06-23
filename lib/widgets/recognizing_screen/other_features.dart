import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OtherFeatures extends StatelessWidget {
  IconData galleryIcon;
  IconData cameraIcon;
  IconData inputTextIcon;
  // double otherFeatureIconSize;
  Function onTapGalleryIcon;
  Function onTapCameraIcon;
  Function onTapInputTextIcon;

  OtherFeatures({
    super.key,
    required this.galleryIcon,
    required this.cameraIcon,
    required this.inputTextIcon,
    // required this.otherFeatureIconSize,
    required this.onTapGalleryIcon,
    required this.onTapCameraIcon,
    required this.onTapInputTextIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Icon(galleryIcon, size: 26,),
              onTap: (){onTapGalleryIcon();},
            ),

            GestureDetector(
              child: Icon(cameraIcon, size: 26,),
              onTap: (){onTapCameraIcon();},
            ),

            GestureDetector(
              child: Icon(inputTextIcon, size: 26,),
              onTap: (){onTapInputTextIcon();},
            ),
          ],
        ),
      ),
    );
  }
}
