import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_aplikasi_translator/main.dart';

class TranslateProvider extends ChangeNotifier{
  // late List<CameraDescription> cameras;

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

  File? image;
  ImagePicker imagePicker = ImagePicker();

  imageFromGallery() async{
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    File image = File(pickedFile!.path);
    this.image = image;
    notifyListeners();
  }

  imageFromCamera() async{
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    File image = File(pickedFile!.path);
    this.image = image;
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

  TextEditingController _recognizedTextConttroller = new TextEditingController();
  TextEditingController get recognizedTextConttroller{
    return _recognizedTextConttroller;
  }

  String _headerTranslatedText = "Translated Text";
  String get headerTranslatedText{
    return _headerTranslatedText;
  }

  TextEditingController _translatedTextConttroller = TextEditingController();
  TextEditingController get translatedTextConttroller{
    return _translatedTextConttroller;
  }
}