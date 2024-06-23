import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  bool cameraStatus;
  String label;
  TextStyle textStyle;
  Color containerColor;
  CameraController cameraController;

  CameraView({
    super.key,
    required this.cameraStatus,
    required this.label,
    required this.textStyle,
    required this.containerColor,
    required this.cameraController
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: cameraStatus == false?
      Container(
        decoration: BoxDecoration(color: containerColor,),
        child: Center(child: Text(label, style: textStyle,),),
      ) :
      CameraPreview(cameraController,),
    );
  }
}