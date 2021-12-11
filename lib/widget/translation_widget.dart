import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/translation_api.dart';
import 'package:flutter_application_1/utils/translations.dart';

class TranslationWidget extends StatefulWidget {
  final String text;
  final String? fromLanguage;
  final String? toLanguage;
  final Widget Function(String? translation) builder;
  //builder: Widget Function(String) containing the result of translation

  const TranslationWidget({
    required this.text,
    required this.fromLanguage,
    required this.toLanguage,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  String? translation;
  /*Either "translation" is marked nullable "?", or the "late" keyword is used
  and the null comparison in buildWaiting() is removed*/

  @override
  Widget build(BuildContext context) {
    //Use of Translations class to get the language code
    final fromLanguageCode = Translations.getLanguageCode(widget.fromLanguage);
    final toLanguageCode = Translations.getLanguageCode(widget.toLanguage);

    return FutureBuilder(
      //Use of TranslationApi class to translate the text
      future: TranslationApi.translate(
          widget.text, fromLanguageCode, toLanguageCode),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return buildWaiting();
          default:
            if (snapshot.hasError) {
              translation = 'Checking Network!';
            } else {
              translation = snapshot.data;
            }
            return widget.builder(translation);
        }
      },
    );
  }

  Widget buildWaiting() =>
      translation == null ? Text('') : widget.builder(translation);
}

/*Widget translation(String txt, String? fl, String? tl) {
  return TranslationWidget(
      text: txt,
      fromLanguage: fl,
      toLanguage: tl,
      builder: (translated) => Text(translated!));
}*/
