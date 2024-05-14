import 'dart:io' as io;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_aplikasi_translator/main.dart';

class TranslateProvider extends ChangeNotifier{
  //RecognizingScreen
  String _recognizing = "Recognizing...";
  String get recognizing{
    return _recognizing;
  }

  CameraController? cameraController;
  void initCamera(){
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraController?.initialize().then((_) {
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
      }
    });
    notifyListeners();
  }

  io.File? image;
  ImagePicker imagePicker = ImagePicker();

  String _result = "";

  String get result{
    return _result;
  }

  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  // TextRecognizer? textRecognizer;

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
    InputImage inputImage = InputImage.fromFile(this.image!);
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

  void pop(BuildContext context){
    Navigator.of(context).pop();
    notifyListeners();
  }

  Icon get arrowDownwardIcon{
    return Icon(Icons.arrow_downward);
  }

  Icon get arrowUpwardIcon{
    return Icon(Icons.arrow_upward);
  }

  String _headerRecognizedText = "Recognized Text";
  String get headerRecognizedText{
   return _headerRecognizedText;
  }

  String textIsRecognized = " ";

  String _headerTranslatedText = "Translated Text";
  String get headerTranslatedText{
    return _headerTranslatedText;
  }

  String textIsTranslated = " ";
}