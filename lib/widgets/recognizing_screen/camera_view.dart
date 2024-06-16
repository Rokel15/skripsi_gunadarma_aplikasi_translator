import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  bool cameraStatus;
  Color containerColor;
  CameraController cameraController;

  CameraView({
    super.key,
    required this.cameraStatus,
    required this.containerColor,
    required this.cameraController
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: cameraStatus == false?
      Container(decoration: BoxDecoration(color: containerColor,),) :
      CameraPreview(cameraController,),
    );
  }
}