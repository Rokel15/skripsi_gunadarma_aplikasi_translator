import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchCameraStatus extends StatelessWidget {
  String frameIcon;
  IconData setCameraStatusIcon;
  Function() setCameraStatus;

  SwitchCameraStatus({
    super.key,
    required this.frameIcon,
    required this.setCameraStatusIcon,
    required this.setCameraStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: Stack(
                children: [
                  Image.asset(
                    frameIcon,
                    height: MediaQuery.of(context).size.width*1/5.8,
                    width: MediaQuery.of(context).size.width*1/5.8,
                  ),

                  Icon(
                    setCameraStatusIcon,
                    size: MediaQuery.of(context).size.width*1/5.8,
                  ),
                ]
            ),
            onTap: (){setCameraStatus();},
          ),
          const SizedBox(width: 14,),
        ],
      ),
    );
  }
}