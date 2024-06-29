import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/translate_provider.dart';
import '../widgets/translate_input_text_screen/input_text.dart';
import '../widgets/translate_input_text_screen/select_look.dart';
import '../widgets/translate_input_text_screen/translate_input.dart';

class TranslateInputTextScreen extends StatelessWidget {
  const TranslateInputTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateProvider>(
      builder: (context, translateProvider, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop){translateProvider.backToRecognizingScreen(context);},
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(),
            ),
            body: ListView(
              children: [
                SelectLook(
                  dropdownButtonValue: translateProvider.selectLook,
                  dropdownButtonItems: translateProvider.looks,
                ),

                const SizedBox(height: 13,),

                InputText(
                  label: translateProvider.inputLabel,
                  textStyleLabel: translateProvider.roboto14Bold,
                  inputTextController: translateProvider.inputTextController,
                  color: translateProvider.inputTextColor,
                  borderColor: Colors.white,
                  selectLanguageValue: translateProvider.selectSourceLanguage,
                  selectLanguageItems: translateProvider.languages,
                  onLanguageChanged: (String val){translateProvider.onSourceLanguageChanged(val);},
                ),

                const SizedBox(height: 20,),

                TranslateInput(
                  label: translateProvider.translateLabel,
                  textStyleTranslateInput: translateProvider.roboto14Bold,
                  translateInputText: translateProvider.textTranslateInput,
                  color: translateProvider.inputTextColor,
                  borderColor: Colors.white,
                  selectLanguageValue: translateProvider.selectTargetLanguage,
                  selectLanguageItems: translateProvider.languages,
                  onLanguageChanged: (String val){translateProvider.onTargetLanguageChanged(val);},
                  tapSementara: () async{await translateProvider.translateInputText();},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}