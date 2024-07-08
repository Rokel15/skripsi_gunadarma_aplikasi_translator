import 'dart:io' as io;
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  io.File? image;
  Icon noImageIcon;

  ShowImage({
    super.key,
    required this.image,
    required this.noImageIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*4.8/10,
      margin: const EdgeInsets.symmetric(horizontal: 46),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: image!=null?
        Image.file(image!, fit: BoxFit.fill,) :
        noImageIcon ,
      ),
    );
  }
}
