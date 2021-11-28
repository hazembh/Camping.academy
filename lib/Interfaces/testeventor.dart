import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Testeventor extends StatefulWidget {
  Testeventor({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TesteventorState createState() => _TesteventorState();
}

class _TesteventorState extends State<Testeventor> {
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      color: Colors.white70,
      child: Column(
        children: [
          ListTile(
            //leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text('Earth Day'),
            subtitle: Text(
              'on april,22 2022',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Card3()
        ],
      ),
    );
  }
}

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildCollapsed3() {
      return Container(
        child: Image.network(
            'https://www.eiroforum.org/wp-content/uploads/earth-day.jpg'),
      );
    }

    buildExpanded3() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
                'https://www.eiroforum.org/wp-content/uploads/earth-day.jpg'),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: Text(
                'The theme of Earth Day 2021 is ‘Restore Our Earth’. Last year, despite significant slowdowns in global economic and social activity due to the pandemic, only a short, sharp reduction of -7.7% in carbon emissions was observed in Europe, compared to 2019. The impact of the coronavirus has captured much of our attention over the past year and in most parts of the world we are yet to restore day-to-day life.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                textAlign: TextAlign.justify,
              ),
            ),
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
            Builder(
              builder: (context) {
                var controller =
                    ExpandableController.of(context, required: true)!;
                return AppBar(
                    backgroundColor: Colors.white,
                    //toolbarHeight: 50,
                    automaticallyImplyLeading: false,
                    title: TextButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('Participate',
                          style: TextStyle(fontSize: 20)),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(
                          controller.expanded
                              ? Icons.arrow_drop_up_rounded
                              : Icons.arrow_drop_down_circle,
                          color: Colors.blue,
                          //size: 100,
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      ),
                    ]);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
