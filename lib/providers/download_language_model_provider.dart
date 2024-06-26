import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class DownloadLanguageModelProvider extends ChangeNotifier{
  final modelManager = OnDeviceTranslatorModelManager();
  bool isAlbanianDownloaded = false;
  bool isArabicDownloaded = false;
  bool isChineseDownloaded = false;
  bool isCroatianDownloaded = false;
  bool isDanishDownloaded = false;
  bool isDutchDownloaded = false;
  bool isEnglishDownloaded = false;
  bool isFrenchDownloaded = false;
  bool isGermanDownloaded = false;
  bool isHindiDownloaded = false;
  bool isIndonesianDownloaded = false;
  bool isIrishDownloaded = false;
  bool isItalianDownloaded = false;
  bool isJapaneseDownloaded = false;
  bool isKoreanDownloaded = false;
  bool isMalayDownloaded = false;
  bool isNorwegianDownloaded = false;
  bool isPolishDownloaded = false;
  bool isRomanianDownloaded = false;
  bool isRussianDownloaded = false;
  bool isSwahiliDownloaded = false;
  bool isSwedishDownloaded =  false;
  bool isTurkishDownloaded = false;
  bool isVietnameseDownloaded = false;

  DownloadLanguageModelProvider(){
    checkAndDownloadModel();
  }

  Future checkAndDownloadModel() async{
    debugPrint('checkAndDownloadModel called');
    try{
      isAlbanianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.albanian.bcpCode);;
      isArabicDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.arabic.bcpCode);
      isChineseDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.chinese.bcpCode);
      isCroatianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.croatian.bcpCode);
      isDanishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.danish.bcpCode);
      isDutchDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.dutch.bcpCode);
      isEnglishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.english.bcpCode);
      isFrenchDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.french.bcpCode);
      isGermanDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.german.bcpCode);
      isHindiDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.hindi.bcpCode);
      isIndonesianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.indonesian.bcpCode);
      isIrishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.irish.bcpCode);
      isItalianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.italian.bcpCode);
      isJapaneseDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.japanese.bcpCode);
      isKoreanDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.korean.bcpCode);
      isMalayDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.malay.bcpCode);
      isNorwegianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.norwegian.bcpCode);
      isPolishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.polish.bcpCode);
      isRomanianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.romanian.bcpCode);
      isRussianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.russian.bcpCode);
      isSwahiliDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.swahili.bcpCode);
      isSwedishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.swedish.bcpCode);
      isTurkishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.turkish.bcpCode);
      isVietnameseDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.polish.bcpCode);

      if(!isAlbanianDownloaded){
        isAlbanianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.albanian.bcpCode, isWifiRequired: false,);
        notifyListeners();
      }

      if(!isArabicDownloaded){
        isArabicDownloaded = await modelManager.downloadModel(
          TranslateLanguage.arabic.bcpCode, isWifiRequired: false,);
        notifyListeners();
      }

      if(!isChineseDownloaded){
        isChineseDownloaded = await modelManager.downloadModel(
          TranslateLanguage.chinese.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isCroatianDownloaded){
        isCroatianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.croatian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isDanishDownloaded){
        isDanishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.danish.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isDutchDownloaded){
        isDutchDownloaded = await modelManager.downloadModel(
          TranslateLanguage.dutch.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isEnglishDownloaded){
        isEnglishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.english.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isFrenchDownloaded){
        isFrenchDownloaded = await modelManager.downloadModel(
          TranslateLanguage.french.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isGermanDownloaded){
        isGermanDownloaded = await modelManager.downloadModel(
          TranslateLanguage.german.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isHindiDownloaded){
        isHindiDownloaded = await modelManager.downloadModel(
          TranslateLanguage.hindi.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isIndonesianDownloaded){
        isIndonesianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.indonesian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isIrishDownloaded){
        isIrishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.irish.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isItalianDownloaded){
        isItalianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.italian.bcpCode, isWifiRequired: false,
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

      if(!isMalayDownloaded){
        isMalayDownloaded = await modelManager.downloadModel(
          TranslateLanguage.malay.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isNorwegianDownloaded){
        isNorwegianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.norwegian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isPolishDownloaded){
        isPolishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.polish.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isRomanianDownloaded){
        isRomanianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.romanian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isRussianDownloaded){
        isRussianDownloaded = await modelManager.downloadModel(
          TranslateLanguage.russian.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isSwahiliDownloaded){
        isSwahiliDownloaded = await modelManager.downloadModel(
          TranslateLanguage.swahili.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isSwedishDownloaded){
        isSwedishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.swedish.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isTurkishDownloaded){
        isTurkishDownloaded = await modelManager.downloadModel(
          TranslateLanguage.turkish.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }

      if(!isVietnameseDownloaded){
        isVietnameseDownloaded = await modelManager.downloadModel(
          TranslateLanguage.vietnamese.bcpCode, isWifiRequired: false,
        );
        notifyListeners();
      }
    }catch(e){
      rethrow;
    }
    notifyListeners();
  }
}