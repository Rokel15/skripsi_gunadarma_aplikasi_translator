import 'package:flutter/material.dart';

class InputTextByUser extends StatelessWidget {
  Icon icon;
  Function() onTapIcon;

  InputTextByUser({
    super.key,
    required this.icon,
    required this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: icon,
      onTap: (){
        onTapIcon();
      },
    );
  }
}