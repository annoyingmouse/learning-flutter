import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAppBar extends StatefulWidget {
  final String text;
  final Function()? tapHandler;

  AdaptiveAppBar(this.text, this.tapHandler);

  @override
  State<AdaptiveAppBar> createState() => _AdaptiveAppBarState();
}

class _AdaptiveAppBarState extends State<AdaptiveAppBar> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              widget.text,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => widget.tapHandler,
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              widget.text,
            ),
            actions: <Widget>[
              IconButton(
                alignment: Alignment.center,
                onPressed: () => widget.tapHandler,
                icon: Icon(
                  Icons.add,
                ),
                color: Colors.white,
              )
            ],
          );
  }
}
