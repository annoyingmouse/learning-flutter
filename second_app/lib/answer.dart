import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // const Question({Key key}) : super(key: key);
  final String answerText;
  final VoidCallback selectHandler;

  Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   primary: Colors.orange,
        //   onPrimary: Colors.black,
        // ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(Colors.blue),
        //   foregroundColor: MaterialStateProperty.all(Colors.amber),
        //   elevation: MaterialStateProperty.all(30),
        // ),
        child: Text(
          answerText,
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
