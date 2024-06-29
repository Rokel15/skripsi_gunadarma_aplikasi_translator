import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/providers/download_language_model_provider.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/camera_view.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/input_alert.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/other_features.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/recognize_text_sign.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/select_language_from_live_camera.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/switch_camera_status.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/translated_text_from_lc.dart';
import '../providers/translate_provider.dart';
import '../widgets/simple_text.dart';

class RecognizingScreen extends StatefulWidget {
  const RecognizingScreen({super.key});

  @override
  State<RecognizingScreen> createState() => _RecognizingScreenState();
}

class _RecognizingScreenState extends State<RecognizingScreen> {
  // late CameraController cameraController;
  
  @override
  void initState(){
    super.initState();
    Provider.of<DownloadLanguageModelProvider>(context, listen: false).checkAndDownloadModel();

    // Provider.of<TranslateProvider>(context, listen: false).checkAndDownloadModel();

    // cameraController = CameraController(cameras[0], ResolutionPreset.high);
    // cameraController.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //       // Handle access errors here.
    //         break;
    //       default:
    //       // Handle other errors here.
    //         break;
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateProvider>(
      builder: (context, translateProvider, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (bool didPoop){SystemNavigator.pop();},
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(),
            ),
            body: Column(
              children: [
                const SizedBox(height: 14,),

                SimpleText(
                  simpleText: translateProvider.simpleText,
                  textStyle: translateProvider.roboto16Bold,
                ),

                const SizedBox(height: 14,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 3.4 / 5,
                    child: Stack(
                      children: [
                        CameraView(
                          cameraStatus: translateProvider.cameraStatus,
                          label: translateProvider.openCameraInstruction,
                          textStyle: translateProvider.roboto16Bold,
                          containerColor: translateProvider.cameraCoverColor,
                          cameraController: translateProvider.cameraController,
                        ),

                        // translateProvider.textResultFromLiveCamera(),

                        // Positioned(
                        //   top: 0.0,
                        //   left: 0.0,
                        //   child:
                        //   translateProvider.textResultFromLiveCamera(),
                        // ),

                      // Widget textResultFromLiveCamera() {
                      //   return Container();
                // if (_scanResult == null ||
                // // cameraController == null ||
                // !cameraController.value.isInitialized) {
                // notifyListeners();
                // return const Text('');
                // }
                //
                // final Size imageSize = Size(
                // cameraController.value.previewSize!.height,
                // cameraController.value.previewSize!.width,
                // );
                // CustomPainter painter = TextRecognitionPainter(imageSize, _scanResult);
                // notifyListeners();
                // return CustomPaint(painter: painter,);
                // }

                        RecognizeTextSign(
                          cameraStatus: translateProvider.cameraStatus,
                          recognizingTextSign: translateProvider.recognizingTextSign,
                          textStyle: translateProvider.roboto16Bold,
                        ),

                        SelectSourceLanguageFromLiveCamera(
                          value: translateProvider.selectSourceLanguage,
                          items: translateProvider.languagesLatinText.map((String val){
                            return DropdownMenuItem(
                              value: val,
                              child: Row(
                                children: [
                                  translateProvider.languageIcon, const Text("  "),
                                  Text(val, style: translateProvider.roboto14SemiBold,),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? val){translateProvider.onSourceLanguageChanged(val);},
                        ),

                        SwitchCameraStatus(
                          frameIcon: translateProvider.frameIcon,
                          setCameraStatusIcon: translateProvider.setCameraStatusIcon,
                          setCameraStatus: (){translateProvider.setCameraStatus();}
                        ),

                        OtherFeatures(
                          galleryIcon: translateProvider.galleryIcon,
                          cameraIcon: translateProvider.cameraIcon,
                          inputTextIcon: translateProvider.inputTextIcon,
                          onTapGalleryIcon: () async{
                            if(translateProvider.selectSourceLanguage != "select language" &&
                                translateProvider.selectTargetLanguage != "select language"){
                              await translateProvider.imageFromGallery();
                              translateProvider.recognizeTextAndTranslate(context);
                            } else{
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return InputAlertDialog(
                                    headAlertText: translateProvider.headAlertText,
                                    bodyAlertText: translateProvider.bodyAlertText,
                                    sourceLabel: translateProvider.sourceLabel,
                                    targetLabel: translateProvider.targetLabel,
                                    selectSourceLanguage: translateProvider.selectSourceLanguage == "select language"?
                                    translateProvider.notSelectedYet :
                                    translateProvider.selectSourceLanguage,
                                    selectTargetLanguage: translateProvider.selectTargetLanguage == "select language"?
                                    translateProvider.notSelectedYet :
                                    translateProvider.selectTargetLanguage,
                                    headTextStyle: translateProvider.blackRoboto16Bold,
                                    bodyTextStyle: translateProvider.roboto14SemiBold,
                                  );},
                              );
                            }
                          },
                          onTapCameraIcon: ()async{
                            if(translateProvider.selectSourceLanguage != "select language" &&
                                translateProvider.selectTargetLanguage != "select language"){
                              await translateProvider.imageFromCamera();
                              translateProvider.recognizeTextAndTranslate(context);
                            } else{
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return InputAlertDialog(
                                    headAlertText: translateProvider.headAlertText,
                                    bodyAlertText: translateProvider.bodyAlertText,
                                    sourceLabel: translateProvider.sourceLabel,
                                    targetLabel: translateProvider.targetLabel,
                                    selectSourceLanguage: translateProvider.selectSourceLanguage == "select language"?
                                    translateProvider.notSelectedYet :
                                    translateProvider.selectSourceLanguage,
                                    selectTargetLanguage: translateProvider.selectTargetLanguage == "select language"?
                                    translateProvider.notSelectedYet :
                                    translateProvider.selectTargetLanguage,
                                    headTextStyle: translateProvider.blackRoboto16Bold,
                                    bodyTextStyle: translateProvider.roboto14SemiBold,
                                  );},
                              );
                            }
                          },
                          onTapInputTextIcon: () => translateProvider.goToInputTextAndTranslate(context),
                        ),
                      ]
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                TranslatedTextFromLc(
                  value: translateProvider.selectTargetLanguage,
                  items: translateProvider.languages.map((String val){
                    return DropdownMenuItem(
                      value: val,
                      child: Row(
                        children: [
                          translateProvider.languageIcon, const Text("  "),
                          Text(val, style: translateProvider.roboto14SemiBold,),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? val){translateProvider.onTargetLanguageChanged(val);},
                  text: translateProvider.translateTextResult,
                  textStyle: translateProvider.roboto14SemiBold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}