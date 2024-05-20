import 'dart:io' as io;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_aplikasi_translator/main.dart';
import 'package:skripsi_aplikasi_translator/screens/camera_and_gallery_translated_screen.dart';

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
  String get recognizing{
    return _recognizing;
  }

  io.File? image;
  ImagePicker imagePicker = ImagePicker();

  String _result = "";

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

  String get result{
    return _result;
  }

  List<String> _charLanguages = ["select language", "language 1", "language 2", "language 3"];
  List<String> get charLanguages{
    return [..._charLanguages];
  }

  String _selecChartLanguage = "select language";
  String get selectCharLanguage{
    return _selecChartLanguage;
  }

  final textRecognizerLatin = TextRecognizer(script: TextRecognitionScript.latin);
  final textRecognizerChinese = TextRecognizer(script: TextRecognitionScript.chinese);
  final textRecognizerJapanese = TextRecognizer(script: TextRecognitionScript.japanese);
  final textRecognizerKorean = TextRecognizer(script: TextRecognitionScript.korean);
  final textRecognitionDevanagiri = TextRecognizer(script: TextRecognitionScript.devanagiri);

  recognizeText() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedTextLatin = await textRecognizerLatin.processImage(inputImage);

    for (TextBlock block in recognizedTextLatin.blocks){
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

  recognizeTextLatin() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedLatinTextLatin = await textRecognizerLatin.processImage(inputImage);

    for (TextBlock block in recognizedLatinTextLatin.blocks){
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

  recognizeTextChinese() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedChineseText = await textRecognizerChinese.processImage(inputImage);

    for (TextBlock block in recognizedChineseText.blocks){
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

  recognizeTextJapanese() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedJapaneseText = await textRecognizerJapanese.processImage(inputImage);

    for (TextBlock block in recognizedJapaneseText.blocks){
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

  recognizeTextKorean() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedKoreanText = await textRecognizerKorean.processImage(inputImage);

    for (TextBlock block in recognizedKoreanText.blocks){
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

  recognizeTextDevanagiri() async{
    InputImage inputImage = InputImage.fromFile(image!);
    RecognizedText recognizedDevanagiriText = await textRecognitionDevanagiri.processImage(inputImage);

    for (TextBlock block in recognizedDevanagiriText.blocks){
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

  final modelManager = OnDeviceTranslatorModelManager();
  bool isEnglishDownloaded = false;
  bool isIndonesianDownloaded = false;
  dynamic onDeviceTranslator;

  Future checkAndDownloadModel() async{
    isEnglishDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.english.bcpCode);
    isIndonesianDownloaded = await modelManager.isModelDownloaded(TranslateLanguage.indonesian.bcpCode);

    if(!isEnglishDownloaded){
      isEnglishDownloaded = await modelManager.downloadModel(TranslateLanguage.english.bcpCode);
      notifyListeners();
    }
    if(!isIndonesianDownloaded){
      isIndonesianDownloaded = await modelManager.downloadModel(TranslateLanguage.indonesian.bcpCode);
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