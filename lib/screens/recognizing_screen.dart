import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/input_image_from_camera.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/input_image_from_gallery.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/input_text_by_user.dart';
import 'package:skripsi_aplikasi_translator/widgets/recognizing_screen/select_language_from_live_camera.dart';
import '../main.dart';
import '../providers/translate_provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(),
          ),
          body: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(40), right: Radius.circular(40),),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 3.4 / 5,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CameraPreview(
                          translateProvider.cameraController,
                        ),
                      ),

                      Align(
                      alignment: Alignment.topLeft,
                        child: Container(
                          margin:  const EdgeInsets.only(top: 20, left: 20),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText(translateProvider.recognizing, textStyle: translateProvider.roboto16Bold)
                            ],
                          ),
                        ),
                      ),

                      SelectLanguageFromLiveCamera(
                        value: translateProvider.selectLanguageForLiveCamera,
                        items: translateProvider.languages.map((String val){
                          return DropdownMenuItem(
                            value: val,
                            child: Row(
                              children: [
                                const Icon(Icons.language), const Text("  "),
                                Text(val, style: translateProvider.roboto14SemiBold,),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? val){translateProvider.onLanguageChangedForLiveCamera(val);},
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              InputImageFromGallery(
                                icon: translateProvider.galleryIcon,
                                onTapIcon: () async{
                                  await translateProvider.imageFromGallery();
                                  translateProvider.recognizeTextAndTranslate(context);
                                },
                              ),

                              InputImageFromCamera(
                                icon: translateProvider.cameraIcon,
                                onTapIcon: () async{
                                  await translateProvider.imageFromCamera();
                                  translateProvider.recognizeTextAndTranslate(context);
                                },
                              ),

                              InputTextByUser(
                                icon: translateProvider.inputTextIcon,
                                onTapIcon: () async{
                                  await translateProvider.goToInputTextAndTranslate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),

              const SizedBox(height: 30,),

              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xff31363F), borderRadius: BorderRadius.vertical(top: Radius.circular(25)),),
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: DropdownButton(
                          value: translateProvider.selectLanguageForLiveCamera,
                          items: translateProvider.languages.map((String val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Row(
                                children: [const Icon(Icons.language), Text(val)],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? val) => translateProvider.onLanguageChangedForLiveCamera(val),
                        ),
                      ),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}