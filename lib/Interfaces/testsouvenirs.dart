import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class Testsouvenir extends StatefulWidget {
  @override
  _TestsouvenirState createState() => _TestsouvenirState();
}

class _TestsouvenirState extends State<Testsouvenir> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[TileItem()],
        ),
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  const TileItem();

  //Future<String> getFilePath() async {
  //  Directory appDocumentsDirectory =
  //      await getApplicationDocumentsDirectory(); // 1
  //  String appDocumentsPath = appDocumentsDirectory.path; // 2
  //  String filePath = '$appDocumentsPath/c5.png'; // 3

  //  return filePath;
  //}

  //void saveFile() async {
  //  File file = File(await getFilePath()); // 1
  //  file.writeAsString(
  //      "This is my demo text that will be saved to : c5.png"); // 2
  //}

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card",
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[

                AspectRatio(
                  aspectRatio: 485.0 / 320.0,
                  child: Image.asset('assets/souvenir1.jpg'),
                ),
                Material(
                  child: ListTile(
                    title: Text(
                      "Borj Cedria",
                    ),
                    subtitle: Text("on  31/12/2014"),
                  ),
                )
              ],
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 200));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return new PageItem();
                        },
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  const PageItem();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      primary: false,
      actions: [
        IconTheme(
            data: IconThemeData(color: Colors.white),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_circle_down_rounded,
              ),
              onPressed: () {},
            ))
      ],
      leading: IconTheme(
          data: IconThemeData(color: Colors.white), child: CloseButton()),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    //final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Stack(children: <Widget>[
      Hero(
        tag: "card$num",
        child: Material(
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 485.0 / 323.0,
                child: Image.asset('assets/souvenir1.jpg'),
              ),
              Material(
                child: ListTile(
                  title: Text("Borj Cedria"),
                  subtitle: Text("on  31/12/2014"),
                ),
              ),
              Expanded(
                child: new ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                        title: Text('Kais Kammoun'),
                        subtitle: Text('Leader'),
                        leading: ClipOval(
                            child: Image.asset(
                          'assets/c5.png',
                          width: 30,
                        ))),
                    ListTile(
                        title: Text('Kais Kammoun'),
                        subtitle: Text('Leader'),
                        leading: ClipOval(
                            child: Image.asset(
                          'assets/c5.png',
                          width: 30,
                        ))),
                    ListTile(
                        title: Text('Kais Kammoun'),
                        subtitle: Text('Leader'),
                        leading: ClipOval(
                            child: Image.asset(
                          'assets/c5.png',
                          width: 30,
                        )))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: appBar.preferredSize.height),
            child: appBar,
          )
        ],
      ),
    ]);
  }
}
