import 'package:flutter/material.dart';

FlatButton getFlatButton(BuildContext context, String text, String clazz) {
  return FlatButton(
    child: Text(text),
    textColor: Colors.blue,
    onPressed: () {
      Navigator.pushNamed(context, clazz, arguments: text);
    },
  );
}