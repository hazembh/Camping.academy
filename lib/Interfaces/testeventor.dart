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
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text('Card title 1'),
            subtitle: Text(
              'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 1'),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 2'),
              ),
            ],
          ),
          Image.asset('assets/souvenir1.jpg'),
          Image.asset('assets/souvenir1.jpg'),
        ],
      ),
    );
  }
}
