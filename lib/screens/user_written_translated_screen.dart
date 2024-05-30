// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:skripsi_aplikasi_translator/widgets/user_written_translated_screen/input_text.dart';
// import 'package:skripsi_aplikasi_translator/widgets/user_written_translated_screen/select_look.dart';
// import 'package:skripsi_aplikasi_translator/widgets/user_written_translated_screen/translate_input.dart';
// import '../providers/translate_provider.dart';
//
// class UserWrittenScreen extends StatefulWidget {
//   const UserWrittenScreen({super.key});
//
//   @override
//   State<UserWrittenScreen> createState() => _UserWrittenScreenState();
// }
//
// class _UserWrittenScreenState extends State<UserWrittenScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TranslateProvider>(
//       builder: (context, translateProvider, child){
//         return Scaffold(
//           appBar: AppBar(),
//           body: ListView(
//             children: [
//               SelectLook(
//                 dropdownButtonValue: translateProvider.selectLook,
//                 dropdownButtonItems: translateProvider.looks,
//               ),
//
//               const SizedBox(height: 13,),
//
//               InputText(
//                 label: translateProvider.inputLabel,
//                 textStyleLabe: translateProvider.roboto14Bold,
//                 inputTextController: translateProvider.inputTextController,
//                 color: Color(0xff2E3840),
//                 borderColor: Colors.white,
//                 selectLanguageValue: translateProvider.selectLanguage,
//                 selectLanguageItems: translateProvider.languages,
//               ),
//
//               const SizedBox(height: 20,),
//
//               TranslateInput(
//                 label: translateProvider.translateLabel,
//                 textStyleTranslateInput: translateProvider.roboto14Bold,
//                 translateInputText: translateProvider.textStyleTranslateInput,
//                 color: Color(0xff2E3840),
//                 borderColor: Colors.white,
//                 selectLanguageValue: translateProvider.selectLanguage,
//                 selectLanguageItems: translateProvider.languages,
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }