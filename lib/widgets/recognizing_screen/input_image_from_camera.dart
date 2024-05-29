import 'package:flutter/material.dart';

class InputImageFromCamera extends StatelessWidget {
  Icon icon;
  Function() onTapIcon;

  InputImageFromCamera({
    super.key,
    required this.icon,
    required this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: icon,
      onTap: (){onTapIcon();},
    );
  }
}