import 'package:flutter/material.dart';

import './text.dart';
import './button.dart';

class App extends StatelessWidget {
  final String text;
  final Function pressHandler;

  App({
    required this.text,
    required this.pressHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextControl(() => pressHandler()),
        DomText(
          text,
        ),
      ],
    );
  }
}
