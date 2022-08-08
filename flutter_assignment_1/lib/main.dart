// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';
import './app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<String> texts = const [
    'Lorem ipsum dolor sit amet',
    'consectetur adipiscing elit'
  ];

  var _textIndex = 0;

  void swapText() {
    setState(() {
      _textIndex = _textIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('My First Assignment'),
          ),
          body: App(text: texts[_textIndex] as String, pressHandler: swapText)),
    );
  }
}
