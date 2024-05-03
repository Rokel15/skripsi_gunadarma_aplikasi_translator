import 'dart:ui';

import 'package:flutter/material.dart';

class TranslateProvider extends ChangeNotifier{
  //RecognizingScreen
  String _recognizing = "Recognizing...";
  String get recognizing{
    return _recognizing;
  }

  List<String> _languages = ["select language", "language 1", "language 2", "language 3"];
  List<String> get languages{
    return [..._languages];
  }

  String _selectLanguage = "select language";
  String get selectLanguage{
    return _selectLanguage;
  }

  void goToLcTranslated({required BuildContext context}){
    Navigator.pushNamed(context, "/lc translated look1 screen");
    notifyListeners();
  }

  //CameraAndGalleryTranslatedScreen

  bool _translatedIsBelow = true;
  bool get translatedIsBelow{
    return _translatedIsBelow;
  }

  void onTextPositionChanged(){
    if(_translatedIsBelow==true){
      _translatedIsBelow = false;
      notifyListeners();
    } else{
      _translatedIsBelow = true;
      notifyListeners();
    }
    notifyListeners();
  }

  // Icon textPosition = _translatedIsBelow? Icon(Icons.arrow_downward):Icon(Icons.arrow_upward);
  // Icon textPosition = Icon(Icons.arrow_upward);
  Icon get recognizedTextIcon{
    return _translatedIsBelow? Icon(Icons.arrow_downward):Icon(Icons.arrow_upward);
  }

  String _headerRecognizedText = "Recognized Text";
  String get headerRecognizedText{
   return _headerRecognizedText;
  }

  TextEditingController _recognizedTextConttroller = new TextEditingController();
  TextEditingController get recognizedTextConttroller{
    return _recognizedTextConttroller;
  }

  String _headerTranslatedText = "Recognized Text";
  String get headerTranslatedText{
    return _headerTranslatedText;
  }

  TextEditingController _translatedTextConttroller = new TextEditingController();
  TextEditingController get translatedTextConttroller{
    return _translatedTextConttroller;
  }
}