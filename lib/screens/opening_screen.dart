import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_translator/providers/translate_provider.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateProvider>(
      builder: (context, translateProvider, child){
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*2.5/4,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(width: 2, color: Colors.white,)
                      ),
                      child: const Text("read me"),
                    ),
                    onTap: () {},
                  ),

                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(width: 2, color: Colors.white,)
                      ),
                      child: const Text("continue >"),
                    ),
                    onTap: () => Navigator.pushNamed(context, "/recognizing screen")
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}