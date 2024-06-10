import 'dart:ffi';
import 'dart:io' as io;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class TranslateProvider extends ChangeNotifier{
  TextStyle roboto14Italic = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400,);
  TextStyle roboto14 = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500,);
  TextStyle roboto14SemiBold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600,);
  TextStyle roboto14Bold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700,);

  TextStyle roboto16Italic = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400,);
  TextStyle roboto16 = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,);
  TextStyle roboto16SemiBold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,);
  TextStyle roboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700,);

  Map<String, dynamic> _languages = {
    "select language": nullptr,
    "English": TranslateLanguage.english,
    "Indonesian": TranslateLanguage.indonesian,
    "Chinese": TranslateLanguage.chinese,
    "Japanese": TranslateLanguage.japanese,
    "Korean": TranslateLanguage.korean,
    "Arabic": TranslateLanguage.arabic,
    "Turkish": TranslateLanguage.turkish,
    "German": TranslateLanguage.german,
    "Dutch": TranslateLanguage.dutch,
    "Hindi": TranslateLanguage.hindi,
    "Russian": TranslateLanguage.russian,
    "French": TranslateLanguage.french,
  };

  List<String> get languages{
    return [..._languages.keys.toList()];
  }

  String _selectSourceLanguage = "select language";
  TranslateLanguage? _sourceLanguage;
  String _selectTargetLanguage = "select language";
  TranslateLanguage? _targetLanguage;
  String _selectLanguageForLiveCamera = "select language";

  String get selectSourceLanguage => _selectSourceLanguage;
  TranslateLanguage? get sourceLanguage => _sourceLanguage;
  String get selectTargetLanguage => _selectTargetLanguage;
  TranslateLanguage? get targetLanguage => _targetLanguage;
  String get selectLanguageForLiveCamera => _selectLanguageForLiveCamera;

  void onSourceLanguageChanged(String? language){
    _selectSourceLanguage = language!;
    _sourceLanguage = _languages[language];
    notifyListeners();
  }

  void onTargetLanguageChanged(String? language){
    _selectTargetLanguage = language!;
    _targetLanguage = _languages[language];
    notifyListeners();
  }

  void onLanguageChangedForLiveCamera(String? language){
    _selectLanguageForLiveCamera = language!;
    notifyListeners();
  }

  List<String> _looks = ["look 1", "look 2"];
  List<String> get looks => [..._looks];

  String _selectLook = "look 1";
  String get selectLook{
    return _selectLook;
  }

  void onLookChange(String look){
    _selectLook = look;
    notifyListeners();
  }

  Future backToRecognizingScreen(BuildContext context) async{
    await emptyImageData();
    await emptyTextInputextAndTranslated();
    Navigator.popAndPushNamed(context, "/recognizing screen");
    notifyListeners();
  }

  // TODO RecognizingScreen
  late CameraController cameraController;
  initializeCamera() async{
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraController.initialize().then((_) {
      // if (!mounted) {
      //   return;
      // }
      // setState(() {});
      notifyListeners();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  String _recognizing = "Recognizing...";
  io.File? image;
  ImagePicker imagePicker = ImagePicker();
  String _result = "";
  String _selecChartLanguage = "select language";
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
  final String _headerRecognizedText = "Recognized Text";
  final String _headerTranslatedText = "Translated Text";
  String textIsRecognized = "";
  String textIsTranslated = "";

  Icon get languageIcon => const Icon(Icons.public);
  Icon get galleryIcon => const Icon(Icons.image);
  Icon get cameraIcon => const Icon(Icons.camera);
  Icon get inputTextIcon => const Icon(Icons.edit);
  String get headerRecognizedText => _headerRecognizedText;
  String get headerTranslatedText => _headerTranslatedText;
  String get recognizing => _recognizing;
  String get result => _result;
  String get selectCharLanguage => _selecChartLanguage;

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

      if(!isIndonesianDownloaded!){
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
      rethrow;
    }
    // if(isEnglishDownloaded && isIndonesianDownloaded){
    //   onDeviceTranslator = OnDeviceTranslator(sourceLanguage: TranslateLanguage.english, targetLanguage: TranslateLanguage.indonesian);
    //   notifyListeners();
    // }
    notifyListeners();
  }

  Future translateText(String text)async{
    if(isEnglishDownloaded && isIndonesianDownloaded!){
      final String response = await OnDeviceTranslator(sourceLanguage: TranslateLanguage.english, targetLanguage: TranslateLanguage.indonesian).translateText(text);
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

  goToInputTextAndTranslate(BuildContext context) async{
    Navigator.pushNamed(context, "/translate input text screen");
    notifyListeners();
  }

  void goToLcTranslated({required BuildContext context}){
    Navigator.pushNamed(context, "/lc translated look1 screen");
    notifyListeners();
  }

  //TODO CameraAndGalleryTranslatedScreen
  bool _translatedIsBelow = true;
  Icon get arrowDownwardIcon => const Icon(Icons.arrow_downward);
  Icon get arrowUpwardIcon => const Icon(Icons.arrow_upward);
  bool get translatedIsBelow => _translatedIsBelow;

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

  //TODO CameraAndGalleryTranslatedScreen
  Color textFromImagecolor = const Color(0xff4C4C6D);

  Future emptyImageData() async{
    image = null;
    textIsRecognized = "";
    textIsTranslated  ="";
    _result = "";
    notifyListeners();
  }

  //TODO TranslateInputTextScreen
  String _inputLabel = "input";
  String _translateLabel = "translate";
  TextEditingController inputTextController = TextEditingController();
  String _textTranslateInput = "";
  Color _inputTextColor = const Color(0xff2E3840);

  String get inputLabel => _inputLabel;
  String get translateLabel => _translateLabel;
  String get textTranslateInput =>_textTranslateInput;
  Color get inputTextColor => _inputTextColor;

  Future translateInputText()async{
    if(sourceLanguage != null && targetLanguage != null){
    // if(isEnglishDownloaded && isIndonesianDownloaded){
      final String response = await OnDeviceTranslator(
        sourceLanguage: sourceLanguage!,
        // sourceLanguage: TranslateLanguage.indonesian,
        targetLanguage: targetLanguage!,
        // targetLanguage: TranslateLanguage.english!,
      ).translateText(inputTextController.text);
      _textTranslateInput = await response;
      notifyListeners();
    }
    notifyListeners();
  }

  Future emptyTextInputextAndTranslated() async {
    inputTextController.text = "";
    _textTranslateInput = "";
    notifyListeners();
  }
}