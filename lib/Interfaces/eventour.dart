import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/testeventor.dart';
import 'package:flutter_application_1/Interfaces/testsouvenirs.dart';

class EventOur extends StatefulWidget {
  const EventOur({Key? key}) : super(key: key);

  @override
  _EventOurState createState() => _EventOurState();
}

class _EventOurState extends State<EventOur> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white70,
            toolbarHeight: 50,
            automaticallyImplyLeading: false,
            elevation: 3.0,
            leading: Icon(Icons.event_note_rounded,
                color: Colors.indigo[900], size: 30),
            title: Text('Events',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.indigo[900],
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.indigo[800],
                  ),
                ),
              ),
            ]),
        body: ListView(
          children: <Widget>[
            Testeventor(
              title: 'Earth day',
            ),
            Testeventor(
              title: 'Earth day',
            )
          ],
        ),
      ),
    );
  }
}
