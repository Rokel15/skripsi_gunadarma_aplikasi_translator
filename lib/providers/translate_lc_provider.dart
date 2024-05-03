import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_aplikasi_translator/data/translate_lc_data.dart';

class TranslateLcProvider extends ChangeNotifier{
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
}