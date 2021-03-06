import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class Item {
  Item({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  String expandedValue;
  String headerValue;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      headerValue: 'Side $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class Panel extends StatefulWidget {
  final String val1;
  final String val3;
  final Color color;

  const Panel(this.val1, this.val3, this.color);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList.radio(
          children: _data.map<ExpansionPanelRadio>((Item item) {
            return ExpansionPanelRadio(
              backgroundColor: widget.color,
              value: item.id,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: TranslationWidget(
                    text: widget.val1,
                    fromLanguage: globals.fromLanguage,
                    toLanguage: globals.toLanguage,
                    builder: (translated) => Text(
                      translated!,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              body: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: ListTile(
                  subtitle: TranslationWidget(
                    text: widget.val3,
                    fromLanguage: globals.fromLanguage,
                    toLanguage: globals.toLanguage,
                    builder: (translated) => Text(translated!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.justify),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
