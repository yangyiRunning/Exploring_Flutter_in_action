import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("生成一串英文的随机字符串和加载一张图片"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "RandomWord");
              },
            ),
            FlatButton(
              child: Text("文本控件，字体样式"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "TextStyleWidget", arguments: "文本控件，字体样式");
              },
            )
          ],
        ),
      ),
    );
  }
}
