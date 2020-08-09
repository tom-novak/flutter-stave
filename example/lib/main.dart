import 'package:flutter/material.dart';
import 'package:stave/stave.dart';

var exampleSong = Score(
  type: ScoreType.partwise,
  version: '3.1',
  parts: [Part(
    id: '1',
    measures: [
        Measure(
          attributes: Attributes(),
          notes: [
            Note(
              pitch: Pitch(),
              type: NoteType.whole,
            ),
          ],
        ),
    ],
  ),],
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stave Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Red River Valley'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Stave(exampleSong),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
