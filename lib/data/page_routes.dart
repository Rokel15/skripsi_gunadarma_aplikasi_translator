import 'package:flutter/material.dart';
import '../screens/lc_translated_look1_screen.dart';
import '../screens/lc_translated_look2_screen.dart';
import '../screens/recognizing_screen.dart';

var initialRoute = "/recognizing screen";

Map<String, Widget Function(BuildContext)> pageRoutes = {
  "/recognizing screen" : (BuildContext context) => RecognizingScreen(),
  "/lc translated look1 screen" : (BuildContext context) => LcTranslatedLook1Screen(),
  "/lc translated look2 screen" : (BuildContext context) => LcTranslatedLook2Screen(),
};