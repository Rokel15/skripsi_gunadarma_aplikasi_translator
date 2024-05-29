import 'package:flutter/material.dart';

class InputImageFromGallery extends StatelessWidget {
  Icon icon;
  Function() onTapIcon;
  InputImageFromGallery({
    super.key,
    required this.icon,
    required this.onTapIcon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: icon,
      onTap: (){onTapIcon();},
    );
  }
}