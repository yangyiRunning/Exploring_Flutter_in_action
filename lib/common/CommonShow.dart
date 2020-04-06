import 'package:flutter/material.dart';

FlatButton getFlatButton(
    BuildContext context, String text, String clazz, String pagerName) {
  return FlatButton(
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
    textColor: Colors.blue,
    onPressed: () {
      Navigator.pushNamed(context, clazz, arguments: text);
    },
  );
}

List<Widget> getLimitListWidget() {
  List<Widget> items = [];
  for (int i = 1; i <= 20; i++) {
    items.add(Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Builder(builder: (context) {
        return FlatButton(
          child: Text(
            "item $i",
            style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("item $i"),
            ));
          },
        );
      }),
    ));
  }
  return items;
}
