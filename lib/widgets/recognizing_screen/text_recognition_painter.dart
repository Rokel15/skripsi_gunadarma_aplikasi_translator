import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognitionPainter extends CustomPainter {
  TextRecognitionPainter(this.absoluteImageSize, this.recognizedText);

  final Size absoluteImageSize;
  final RecognizedText recognizedText;

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.brown;

    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      // canvas.drawRect(
      //   Rect.fromLTRB(
      //     block.boundingBox.left * scaleX,
      //     block.boundingBox.top * scaleY,
      //     block.boundingBox.right * scaleX,
      //     block.boundingBox.bottom * scaleY,
      //   ),
      //   paint,
      // );
      //
      // TextSpan span = TextSpan(
      //     text: block.text,
      //     style: const TextStyle(fontSize: 20, color: Colors.red));
      // TextPainter tp = TextPainter(
      //     text: span,
      //     textAlign: TextAlign.left,
      //     textDirection: TextDirection.ltr);
      // tp.layout();
      // tp.paint(canvas, Offset(block.boundingBox.left * scaleX, block.boundingBox.top * scaleY));

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        canvas.drawRect(
          Rect.fromLTRB(
            line.boundingBox.left * scaleX,
            line.boundingBox.top * scaleY,
            line.boundingBox.right * scaleX,
            line.boundingBox.bottom * scaleY,
          ),
          paint,
        );

        TextSpan span = TextSpan(
            text: line.text,
            style: const TextStyle(fontSize: 20, color: Colors.indigo));
        TextPainter tp = TextPainter(
            text: span,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(canvas, Offset(line.boundingBox.left * scaleX, line.boundingBox.top * scaleY));

        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }

  @override
  bool shouldRepaint(TextRecognitionPainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.recognizedText != recognizedText;
  }
}