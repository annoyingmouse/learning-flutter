import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function pressHandler;

  TextControl(this.pressHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.black,
        ),
        child: Text(
          'Change Text',
        ),
        onPressed: () => pressHandler(),
      ),
    );
  }
}
