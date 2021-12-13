import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/translations.dart';

class DropDownWidget extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChangedLanguage;

  const DropDownWidget({
    required this.value,
    required this.onChangedLanguage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Create the list items of the drop down menu using the available languages
    final itemflags = Translations.langflags;
    final items = Translations.languages
        .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: RichText(
                    text: TextSpan(
                      text: value,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Kalam'),
                      children: [
                        WidgetSpan(
                            child: SizedBox(
                              width: 12,
                            ),
                            alignment: PlaceholderAlignment.middle),
                        WidgetSpan(
                          child: Image.asset(
                            itemflags[value]!,
                            width: 40,
                            height: 40,
                          ),
                          alignment: PlaceholderAlignment.middle,
                        ),
                      ],
                    ),
                  ),
                ))
        .toList();
    return DropdownButton<String>(
      items: items,
      value: value,
      icon: Icon(Icons.expand_more, color: Colors.grey),
      iconSize: 24,
      dropdownColor: Color.fromRGBO(240, 204, 204, 1),
      elevation: 16,
      borderRadius: BorderRadius.circular(20),
      onChanged: onChangedLanguage,
    );
  }
}
