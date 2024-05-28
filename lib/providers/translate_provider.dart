import 'dart:io' as io;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:image_picker/image_picker.dart';

class TranslateProvider extends ChangeNotifier{
  TextStyle roboto14Italic = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400,);
  TextStyle roboto14 = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500,);
  TextStyle roboto14SemiBold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600,);
  TextStyle roboto14Bold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700,);

  TextStyle roboto16Italic = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400,);
  TextStyle roboto16 = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,);
  TextStyle roboto16SemiBold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,);
  TextStyle roboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700,);

  List<String> _languages = ["select language", "language 1", "language 2", "language 3"];
  List<String> get languages{
    return [..._languages];
  }

  String _selectLanguage = "select language";
  String get selectLanguage{
    return _selectLanguage;
  }

  void onLanguageChanged(String? language){
    _selectLanguage = language!;
    notifyListeners();
  }

  List<String> _looks = ["look 1", "look 2"];
  List<String> get looks{
    return [..._looks];
  }

  String _selectLook = "look 1";
  String get selectLook{
    return _selectLook;
  }

  void onLookChange(String look){
    _selectLook = look;
    notifyListeners();
  }


  //TODO RecognizingScreen
  String _recognizing = "Recognizing...";
  io.File? image;
  ImagePicker imagePicker = ImagePicker();
  String _result = "";
  String _selecChartLanguage = "select language";
  List<String> _charLanguages = ["select language", "language 1", "language 2", "language 3"];
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
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
  dynamic onDeviceTranslator;

  String get recognizing{
    return _recognizing;
  }

  String get result{
    return _result;
  }

  String get selectCharLanguage{
    return _selecChartLanguage;
  }

  List<String> get charLanguages{
    return [..._charLanguages];
  }

  imageFromGallery() async{
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    io.File image = io.File(pickedFile!.path);
    this.image = image;
    notifyListeners();
  }

  imageFromCamera() async{
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    io.File image = io.File(pickedFile!.path);
    this.image = image;
    notifyListeners();
  }

  recognizeText() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    for (TextBlock block in recognizedText.blocks){
      final Rect rect = block.boundingBox;
      final List cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          _result += element.text+" ";
          // Same getters as TextBlock
          notifyListeners();
        }
        _result += "\n";
        notifyListeners();
      }
      _result += "\n";
      notifyListeners();
    }

    textIsRecognized = result;
    notifyListeners();
  }

  Future checkAndDownloadModel() async{
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
      isIndonesianDownloaded = await modelManager.downloadModel(TranslateLanguage.indonesian.bcpCode);
      notifyListeners();
    }

    if(!isEnglishDownloaded){
      isEnglishDownloaded = await modelManager.downloadModel(TranslateLanguage.english.bcpCode);
      notifyListeners();
    }

    if(!isChineseDownloaded){
      isChineseDownloaded = await modelManager.downloadModel(TranslateLanguage.chinese.bcpCode);
      notifyListeners();
    }

    if(!isJapaneseDownloaded){
      isJapaneseDownloaded = await modelManager.downloadModel(TranslateLanguage.japanese.bcpCode);
      notifyListeners();
    }

    if(!isKoreanDownloaded){
      isKoreanDownloaded = await modelManager.downloadModel(TranslateLanguage.korean.bcpCode);
      notifyListeners();
    }

    if(!isArabicDownloaded){
      isArabicDownloaded = await modelManager.downloadModel(TranslateLanguage.arabic.bcpCode);
      notifyListeners();
    }

    if(!isTurkishDownloaded){
      isTurkishDownloaded = await modelManager.downloadModel(TranslateLanguage.turkish.bcpCode);
      notifyListeners();
    }

    if(!isGermanDownloaded){
      isGermanDownloaded = await modelManager.downloadModel(TranslateLanguage.german.bcpCode);
      notifyListeners();
    }

    if(!isDutchDownloaded){
      isDutchDownloaded = await modelManager.downloadModel(TranslateLanguage.dutch.bcpCode);
      notifyListeners();
    }

    if(!isHindiDownloaded){
      isHindiDownloaded = await modelManager.downloadModel(TranslateLanguage.hindi.bcpCode);
      notifyListeners();
    }

    if(!isRussianDownloaded){
      isRussianDownloaded = await modelManager.downloadModel(TranslateLanguage.russian.bcpCode);
      notifyListeners();
    }

    if(!isFrenchDownloaded){
      isFrenchDownloaded = await modelManager.downloadModel(TranslateLanguage.french.bcpCode);
      notifyListeners();
    }


    if(isEnglishDownloaded && isIndonesianDownloaded){
      onDeviceTranslator = OnDeviceTranslator(sourceLanguage: TranslateLanguage.english, targetLanguage: TranslateLanguage.indonesian);
      notifyListeners();
    }
    notifyListeners();
  }

  Future translateText(String text)async{
    // await checkAndDownloadModel();
    if(isEnglishDownloaded && isIndonesianDownloaded){
      final String response = await onDeviceTranslator.translateText(text);
      final String response2 = await OnDeviceTranslator(sourceLanguage: TranslateLanguage.chinese, targetLanguage: TranslateLanguage.indonesian).translateText(text);
      textIsTranslated = response;
      notifyListeners();
    }
    notifyListeners();
  }

  recognizeTextAndTranslate(BuildContext context) async {
    await recognizeText();
    await translateText(textIsRecognized);
    Navigator.pushNamed(context, "/image translated screen");
    notifyListeners();
  }

  void goToLcTranslated({required BuildContext context}){
    Navigator.pushNamed(context, "/lc translated look1 screen");
    notifyListeners();
  }

  //TODO CameraAndGalleryTranslatedScreen
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

  Future emptyData() async{
    image = null;
    textIsRecognized = "";
    textIsTranslated  ="";
    _result = "";
    notifyListeners();
  }

  Future backToRecognizingScreen(BuildContext context) async{
    await emptyData();
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(context, "/recognizing screen", (route) => false);
  }

  Icon get arrowDownwardIcon{
    return const Icon(Icons.arrow_downward);
  }

  Icon get arrowUpwardIcon{
    return const Icon(Icons.arrow_upward);
  }

  final String _headerRecognizedText = "Recognized Text";
  String get headerRecognizedText{
   return _headerRecognizedText;
  }

  String textIsRecognized = "";

  final String _headerTranslatedText = "Translated Text";
  String get headerTranslatedText{
    return _headerTranslatedText;
  }

  String textIsTranslated = "";

  //TODO UserWrittenTranslatedScreen
  String inputLabel = "input";
  String translateLabel = "translate";
  TextEditingController inputTextController = TextEditingController();
  String textStyleTranslateInput = "";
}