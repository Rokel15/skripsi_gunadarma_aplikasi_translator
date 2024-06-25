import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class DownloadLanguageModelProvider extends ChangeNotifier{
  final modelManager = OnDeviceTranslatorModelManager();
  bool isIndonesianDownloaded = false;
  bool isEnglishDownloaded = false;
  bool isChineseDownloaded = false;
  bool isJapaneseDownloaded = false;
  bool isKoreanDownloaded = false;
  bool isArabicDownloaded = false;
  bool isTurkishDownloaded = false;
  bool isGermanDownloaded = false;
  bool isDutchDownloaded = false;
  bool isHindiDownloaded = false;
  bool isRussianDownloaded = false;
  bool isFrenchDownloaded = false;

  DownloadLanguageModelProvider(){
    checkAndDownloadModel();
  }

  Future checkAndDownloadModel() async{
    debugPrint('checkAndDownloadModel called');
    try{
      isIndonesianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.indonesian.bcpCode);
      isEnglishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.english.bcpCode);
      isChineseDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.chinese.bcpCode);
      isJapaneseDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.japanese.bcpCode);
      isKoreanDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.korean.bcpCode);
      isArabicDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.arabic.bcpCode);
      isTurkishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.turkish.bcpCode);
      isGermanDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.german.bcpCode);
      isDutchDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.dutch.bcpCode);
      isHindiDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.hindi.bcpCode);
      isRussianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.russian.bcpCode);
      isFrenchDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.french.bcpCode);

      if(!isIndonesianDownloaded){
        isIndonesianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.indonesian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isEnglishDownloaded){
        isEnglishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.english.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isChineseDownloaded){
        isChineseDownloaded = await modelManager.downloadModel(
          TranslateLanguage.chinese.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isJapaneseDownloaded){
        isJapaneseDownloaded = await modelManager.downloadModel(
          TranslateLanguage.japanese.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isKoreanDownloaded){
        isKoreanDownloaded = await modelManager.downloadModel(
          TranslateLanguage.korean.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isArabicDownloaded){
        isArabicDownloaded = await modelManager.downloadModel(
          TranslateLanguage.arabic.bcpCode, isWifiRequired: false,);
        notifyListeners();
      }

      if(!isTurkishDownloaded){
        isTurkishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.turkish.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isGermanDownloaded){
        isGermanDownloaded = await modelManager.downloadModel(
          TranslateLanguage.german.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isDutchDownloaded){
        isDutchDownloaded = await modelManager.downloadModel(
          TranslateLanguage.dutch.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isHindiDownloaded){
        isHindiDownloaded = await modelManager.downloadModel(
          TranslateLanguage.hindi.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isRussianDownloaded){
        isRussianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.russian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isFrenchDownloaded){
        isFrenchDownloaded = await modelManager.downloadModel(
          TranslateLanguage.french.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }
    }catch(e){
      debugPrint('Error downloading model: $e');
    }
    notifyListeners();
  }
}