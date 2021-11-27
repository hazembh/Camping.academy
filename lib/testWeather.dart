import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class buildRow extends StatelessWidget {
  final String title;

  buildRow(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0)),
      Container(
        child: Text(title,
            textAlign: TextAlign.start, style: TextStyle(fontSize: 18)),
        width: 120,
      ),
      SizedBox(
        width: 115,
      ),
      Icon(
        Icons.wb_cloudy_rounded,
        color: Colors.lightBlueAccent,
        size: 25,
      ),
      SizedBox(
        width: 50,
      ),
      Text('24°/12°',
          textAlign: TextAlign.start, style: TextStyle(fontSize: 16))
    ]);
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildCollapsed3() {
      return Container();
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildRow('Tuesday  '),
            SizedBox(height: 12),
            buildRow('Wednesday'),
            SizedBox(height: 12),
            buildRow('Thursday '),
            SizedBox(height: 12),
            buildRow('Friday   '),
            SizedBox(height: 12),
            buildRow('Saturday '),
            SizedBox(height: 12),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expandable(
              collapsed: buildCollapsed3(),
              expanded: buildExpanded3(),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var controller =
                        ExpandableController.of(context, required: true)!;
                    return TextButton(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          controller.expanded ? "COLLAPSE" : "EXPAND",
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.deepPurple,
                                fontSize: 16,
                              ),
                        ),
                      ),
                      onPressed: () {
                        controller.toggle();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
