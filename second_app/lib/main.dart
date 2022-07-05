import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion(int answer) {
    print('Answer chosen $answer');
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      "What's your favourite colour",
      "What's your favourite animal"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Second Application'),
        ),
        body: Column(
          children: <Widget>[
            // Text(questions[0]),
            Text(questions.elementAt(0)),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: () => answerQuestion(1),
            ),
            ElevatedButton(
              child: Text('Answer 2'),
              onPressed: () {
                // ...
                print('Answer 2 chosen');
              },
            ),
            ElevatedButton(
              child: Text('Answer 3'),
              onPressed: () => print('Answer 3 chosen'),
            ),
          ],
        ),
      ),
    );
  }
}
