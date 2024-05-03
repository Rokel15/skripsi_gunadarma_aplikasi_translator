import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/screens/camera_and_gallery_translated_screen.dart';

import '../main.dart';
import '../providers/translate_provider.dart';

class RecognizingScreen extends StatefulWidget {
  const RecognizingScreen({super.key});

  @override
  State<RecognizingScreen> createState() => _RecognizingScreenState();
}

class _RecognizingScreenState extends State<RecognizingScreen> {
  late CameraController cameraController;

  List<String> languages = ["select language", "language 1", "language 2", "language 3"];
  String selectLanguage = "select language";

  void onLanguageChanged(String? language){
    setState(() {
      selectLanguage = language!;
    });
  }

  File? image;
  late ImagePicker imagePicker;

  imageFromGallery() async{
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    File image = File(pickedFile!.path);
    setState(() {
      this.image = image;
    });
  }

  imageFromCamera() async{
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    File image = File(pickedFile!.path);
    setState(() {
      this.image = image;
    });
  }

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
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
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateProvider>(
      builder: (context, translateLcProvider, child){
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(),
          ),
          body: Column(
            children: [
              ClipRRect(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(40), right: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*3.4/5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border(),
                    // borderRadius: BorderRadius.horizontal(left: Radius.circular(40), right: Radius.circular(40)),
                  ),
                  child: CameraPreview(
                    cameraController,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Icon(Icons.image),
                    onTap: () async{
                      await imageFromGallery();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraAndGalleryTranslatedScreen(image: image!)),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Icon(Icons.camera_alt),
                    onTap: () async{
                      await imageFromCamera();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraAndGalleryTranslatedScreen(image: image!)),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: (){},
                  )
                ],
              ),

              SizedBox(height: 20,),

              SizedBox(height: 20,),

              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20), padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                  ),
                  child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: DropdownButton(
                            value:  selectLanguage,
                            items: languages.map((String val){
                              return DropdownMenuItem(
                                value: val,
                                child: Row(
                                  children: [Icon(Icons.language), Text(val)],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? val){onLanguageChanged(val);},
                          ),
                        ),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      ]
                  ),
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            shape: CircleBorder(),
            onPressed: (){
              // Navigator.pushNamed(context, "/lc translated look1 screen");
              Navigator.pushNamed(context, "/lc translated look2 screen");
            },
          ),
        );
      },
    );
  }
}