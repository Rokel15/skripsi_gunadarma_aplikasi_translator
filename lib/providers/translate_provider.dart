import 'dart:io' as io;
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  TextStyle blackRoboto16SemiBold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
  TextStyle blackRoboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);

  final Map<String, dynamic> _languagesLatinText = {
    "select language": null,
    "Albanian": TranslateLanguage.albanian,
    "Croatian": TranslateLanguage.croatian,
    "Danish": TranslateLanguage.danish,
    "Dutch": TranslateLanguage.dutch,
    "English": TranslateLanguage.english,
    "French": TranslateLanguage.french,
    "German": TranslateLanguage.german,
    "Indonesian": TranslateLanguage.indonesian,
    "Irish": TranslateLanguage.irish,
    "Italian": TranslateLanguage.italian,
    "Malay" : TranslateLanguage.malay,
    "Norwegian": TranslateLanguage.norwegian,
    "Polish": TranslateLanguage.polish,
    "Romanian": TranslateLanguage.romanian,
    "Swahili" : TranslateLanguage.swahili,
    "Swedish": TranslateLanguage.swedish,
    "Turkish": TranslateLanguage.turkish,
    "Vietnamese" : TranslateLanguage.vietnamese,
  };

  List<String> get languagesLatinText{
    return [..._languagesLatinText.keys.toList()];
  }

  final Map<String, dynamic> _languages = {
    "select language": null,
    "Albanian": TranslateLanguage.albanian,
    "Arabic": TranslateLanguage.arabic,
    "Chinese": TranslateLanguage.chinese,
    "Croatian": TranslateLanguage.croatian,
    "Danish": TranslateLanguage.danish,
    "Dutch": TranslateLanguage.dutch,
    "English": TranslateLanguage.english,
    "French": TranslateLanguage.french,
    "German": TranslateLanguage.german,
    "Hindi": TranslateLanguage.hindi,
    "Indonesian": TranslateLanguage.indonesian,
    "Irish": TranslateLanguage.irish,
    "Italian": TranslateLanguage.italian,
    "Japanese": TranslateLanguage.japanese,
    "Korean": TranslateLanguage.korean,
    "Malay" : TranslateLanguage.malay,
    "Norwegian": TranslateLanguage.norwegian,
    "Polish": TranslateLanguage.polish,
    "Romanian": TranslateLanguage.romanian,
    "Russian": TranslateLanguage.russian,
    "Swahili" : TranslateLanguage.swahili,
    "Swedish": TranslateLanguage.swedish,
    "Turkish": TranslateLanguage.turkish,
    "Vietnamese" : TranslateLanguage.vietnamese,
  };

  List<String> get languages{
    return [..._languages.keys.toList()];
  }

  String _selectSourceLanguage = "select language";
  TranslateLanguage? _sourceLanguage;
  String _selectTargetLanguage = "select language";
  TranslateLanguage? _targetLanguage;

  String get selectSourceLanguage => _selectSourceLanguage;
  TranslateLanguage? get sourceLanguage => _sourceLanguage;
  String get selectTargetLanguage => _selectTargetLanguage;
  TranslateLanguage? get targetLanguage => _targetLanguage;

  // void onSourceLanguageChangedForLiveCamera(String? language){
  //   _selectSourceLanguageForLiveCamera = language!;
  //   _sourceLanguageForLiveCamera = _languages[language];
  //   notifyListeners();
  // }
  //
  // void onTargetLanguageChangedForLiveCamera(String? language){
  //   _selectTargetLanguageForLiveCamera = language!;
  //   _targetLanguageForLiveCamera = _languages[language];
  //   notifyListeners();
  // }

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

  setSelectDefault() async{
    _selectSourceLanguage = "select language";
    _selectTargetLanguage = "select language";
    notifyListeners();
  }

  Future backToRecognizingScreen(BuildContext context) async{
    await setSelectDefault();
    await emptyImageData();
    await emptyTextInputextAndTranslated();
    Navigator.popAndPushNamed(context, "/recognizing screen");
    notifyListeners();
  }

  //TODO RecognizingScreen
  final _recognizingTextSign = "Recognizing...";
  CameraController cameraController = CameraController(cameras[0], ResolutionPreset.high, imageFormatGroup: ImageFormatGroup.yuv420);
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  Color cameraCoverColor = const Color(0xff686D76);
  bool _cameraStatus = false;
  final _frameIcon = "image/frameIcon.png";
  String openCameraInstruction = "Open Camera!";
  CameraImage? _cameraImage;
  bool isBusy = false;
  String _getText = "";
  String _scanResult = "";
  String _textResult = "";
  String _translateTextResult = "";
  final _isNotScanningResult = "no text recognized";

  bool get cameraStatus => _cameraStatus;
  CameraImage get cameraImage => _cameraImage!;
  String get getText => _getText;
  String get scanResult => _scanResult;
  String get textResult => _textResult;
  String get translateTextResult => _translateTextResult;
  String get isNotScanningResult => _isNotScanningResult;

  Future setCameraStatus()async{
    if(cameraStatus==false){
      _cameraStatus = true;
      await initializeCamera();
      notifyListeners();
    } else{
      _cameraStatus = false;
      if (cameraController.value.isStreamingImages) {
        await cameraController.stopImageStream();
        notifyListeners();
      }
      if (cameraController.value.isRecordingVideo) {
        await cameraController.stopVideoRecording();
        notifyListeners();
      }
      // await cameraController.stopImageStream();
      // await cameraController.stopVideoRecording();

      cameraController.dispose();
      // _scanResult = isNotScanningResult;
      // _scanResult = "";
      notifyListeners();
    }
    notifyListeners();
  }

  Future initializeCamera() async {
    cameraController = CameraController(cameras[0], ResolutionPreset.high, imageFormatGroup: ImageFormatGroup.yuv420);
    try {
      await cameraController.initialize();
      cameraController.startImageStream((image) {
        if (!isBusy) {
          isBusy = true;
          _cameraImage = image;
          doTextRecognitionOnLiveCamera();
        }
      });
    } catch (e) {
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
    }
    notifyListeners();
  }

  // initializeCamera() async{
  //   await cameraController.initialize().then((_) {
  //     // if (!mounted) {
  //     //   return;
  //     // }
  //     // setState(() {});
  //     cameraController.startImageStream((image) {
  //       if(!isBusy){
  //         isBusy = true;
  //       _cameraImage = image;
  //       doTextRecognitionOnLiveCamera();
  //       notifyListeners();
  //       };
  //     });
  //     notifyListeners();
  //   }).catchError((Object e) {
  //     if (e is CameraException) {
  //       switch (e.code) {
  //         case 'CameraAccessDenied':
  //         // Handle access errors here.
  //           break;
  //         default:
  //         // Handle other errors here.
  //           break;
  //       }
  //       notifyListeners();
  //     }
  //     notifyListeners();
  //   });
  //   notifyListeners();
  // }

  @override
  dispose(){
    cameraController.dispose();
    super.dispose();
    // notifyListeners();
  }

  doTextRecognitionOnLiveCamera() async {
    var frameImage = getInputImageFromLiveCamera();
    RecognizedText recognizedText = await textRecognizer.processImage(frameImage);
    _scanResult = "";

    for (TextBlock block in recognizedText.blocks){
      final Rect rect = block.boundingBox;
      final List cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;
      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          _scanResult += element.text+" ";
          // Same getters as TextBlock
          notifyListeners();
        }
        _scanResult += "\n";
        notifyListeners();
      }
      _scanResult += "\n";
      notifyListeners();
    }

    isBusy = false;
    translateTextFromLiveCamera(_scanResult);
    notifyListeners();
  }

  // void doTextRecognitionOnLiveCamera() async {
  //   try {
  //     var frameImage = getInputImageFromLiveCamera();
  //     RecognizedText recognizedText = await textRecognizer.processImage(frameImage);
  //     _scanResult = "";
  //
  //     for (TextBlock block in recognizedText.blocks) {
  //       final Rect rect = block.boundingBox;
  //       final List cornerPoints = block.cornerPoints;
  //       final String text = block.text;
  //       final List<String> languages = block.recognizedLanguages;
  //       for (TextLine line in block.lines) {
  //         // Same getters as TextBlock
  //         for (TextElement element in line.elements) {
  //           _scanResult += element.text + " ";
  //           // Same getters as TextBlock
  //           notifyListeners();
  //         }
  //         _scanResult += "\n";
  //         notifyListeners();
  //       }
  //       _scanResult += "\n";
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print("Error in text recognition: $e");
  //   }
  //
  //   isBusy = false;
  //   notifyListeners();
  // }

  getInputImageFromLiveCamera(){
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in cameraImage.planes){
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    final Size imageSize = Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());
    final camera = cameras[0];
    final bytesPerRow = cameraImage.planes[0].bytesPerRow;
    final imageRotation =  InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    final inputImageFormat = InputImageFormatValue.fromRawValue(cameraImage.format.raw);
    // final planeData = cameraImage!.planes.map(
    //       (Plane plane) {
    //     return InputImagePlaneMetadata(
    //       bytesPerRow: plane.bytesPerRow,
    //       height: plane.height,
    //       width: plane.width,
    //     );
    //   },
    // ).toList();
    final metadata = InputImageMetadata(
      bytesPerRow: bytesPerRow,
      size: imageSize,
      rotation: imageRotation!,
      format: inputImageFormat!,
    );

    final inputImage = InputImage.fromBytes(
        bytes: bytes, metadata: metadata
    );

    notifyListeners();
    return inputImage;
  }

  translateTextFromLiveCamera(String text)async{
    if (sourceLanguage != null && targetLanguage != null){
      final String response = await OnDeviceTranslator(
        sourceLanguage: sourceLanguage!,
        targetLanguage: targetLanguage!,
      ).translateText(text);
      _translateTextResult = response;
      notifyListeners();
    }
    notifyListeners();
  }

  // Widget textResultFromLiveCamera() {
  //   if (_scanResult == null ||
  //       // cameraController == null ||
  //       !cameraController.value.isInitialized) {
  //     notifyListeners();
  //     return const Text('');
  //   }
  //
  //   final Size imageSize = Size(
  //     cameraController.value.previewSize!.height,
  //     cameraController.value.previewSize!.width,
  //   );
  //   CustomPainter painter = TextRecognitionPainter(imageSize, _scanResult);
  //   notifyListeners();
  //   return CustomPaint(painter: painter,);
  // }

  io.File? image;
  ImagePicker imagePicker = ImagePicker();
  String _result = "";
  final _selectChartLanguage = "select language";
  dynamic onDeviceTranslator;
  final String _headerRecognizedText = "Recognized Text";
  final String _headerTranslatedText = "Translated Text";
  String _textIsRecognized = "";
  String _textIsTranslated = "";

  Icon get languageIcon => const Icon(Icons.public);
  String get frameIcon => _frameIcon;
  IconData get setCameraStatusIcon => Icons.camera_alt;
  IconData get galleryIcon => Icons.image;
  IconData get cameraIcon => Icons.camera;
  IconData get inputTextIcon => Icons.edit;
  String get headerRecognizedText => _headerRecognizedText;
  String get headerTranslatedText => _headerTranslatedText;
  String get recognizingTextSign => _recognizingTextSign;
  String get result => _result;
  String get selectCharLanguage => _selectChartLanguage;
  String get textIsRecognized => _textIsRecognized;
  String get textIsTranslated => _textIsTranslated;

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

    _textIsRecognized = result;
    notifyListeners();
  }


  Future translateText(String text)async{
    if(sourceLanguage != null && targetLanguage != null){
      final String response = await OnDeviceTranslator(
        sourceLanguage: sourceLanguage!,
        targetLanguage: targetLanguage!,
      ).translateText(text);
      _textIsTranslated = response;
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

  //TODO ShowDialog
  String headAlertText = "Attention";
  String bodyAlertText = "Please fill source language and target language first!";
  String sourceLabel = "Source Language";
  String targetLabel = "Target Language";
  String notSelectedYet = "not selected yet";

  //TODO CameraAndGalleryTranslatedScreen
  Color textFromImageColor = const Color(0xff4C4C6D);
  bool _translatedIsBelow = true;
  Icon get noImageIcon => Icon(Icons.find_in_page);
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

  Future emptyImageData() async{
    image = null;
    _textIsRecognized = "";
    _textIsTranslated  ="";
    _result = "";
    notifyListeners();
  }

  //TODO TranslateInputTextScreen
  final _simpleText = "Translated By ML Kit";
  final _inputLabel = "input";
  final _translateLabel = "translate";
  TextEditingController inputTextController = TextEditingController();
  String _textTranslateInput = "";
  final _inputTextColor = const Color(0xff2E3840);
  String _selectLanguageToTranslate = "select language";

  String get simpleText => _simpleText;
  String get inputLabel => _inputLabel;
  String get translateLabel => _translateLabel;
  String get textTranslateInput => _textTranslateInput;
  Color get inputTextColor => _inputTextColor;

  Future translateInputText()async{
    if(sourceLanguage != null && targetLanguage != null){
      final String response = await OnDeviceTranslator(
        sourceLanguage: sourceLanguage!,
        targetLanguage: targetLanguage!,
      ).translateText(inputTextController.text);
      _textTranslateInput = response;
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