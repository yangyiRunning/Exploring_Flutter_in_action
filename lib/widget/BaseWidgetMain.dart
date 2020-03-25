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
                Navigator.pushNamed(context, "TextStyleWidget",
                    arguments: "文本控件，字体样式");
              },
            ),
            FlatButton(
              textColor: Colors.blue,
              child: Text("按钮系列"),
              onPressed: () {
                Navigator.pushNamed(context, "ButtonWidget", arguments: "按钮系列");
              },
            ),
            FlatButton(
              textColor: Colors.blue,
              child: Text("图片系列"),
              onPressed: () {
                Navigator.pushNamed(context, "IconWidget", arguments: "图片系列");
              },
            ),
            FlatButton(
              textColor: Colors.blue,
              child: Text("单选开关和复选框"),
              onPressed: () {
                Navigator.pushNamed(context, "SwitchCheckboxWidget",
                    arguments: "单选开关和复选框");
              },
            ),
            FlatButton(
              textColor: Colors.blue,
              child: Text("输入框和表单"),
              onPressed: () {
                Navigator.pushNamed(context, "EditTextFormWidget",
                    arguments: "输入框和表单");
              },
            )
          ],
        ),
      ),
    );
  }
}
