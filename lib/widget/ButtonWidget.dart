import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonState();
  }
}

class ButtonState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("默认带有阴影和灰色背景。按下后，阴影会变大。↓", textAlign: TextAlign.center),
                RaisedButton(
                  child: Text("漂浮按钮"),
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState.showSnackBar(SnackBar(
                      content: Text("默认带有阴影和灰色背景。按下后，阴影会变大。"),
                    ));
                  },
                ),
                Text("默认背景透明并不带阴影。按下后，会有背景色。↓", textAlign: TextAlign.center),
                FlatButton(
                  child: Text("扁平按钮"),
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState.showSnackBar(SnackBar(
                      content: Text("默认背景透明并不带阴影。按下后，会有背景色。"),
                    ));
                  },
                ),
                Text("默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和弱阴影。↓",
                    textAlign: TextAlign.center),
                OutlineButton(
                  child: Text("边框按钮"),
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState.showSnackBar(SnackBar(
                      content:
                          Text("默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和弱阴影。"),
                    ));
                  },
                ),
                Text("可点击的Icon，不包括文字，默认没有背景，点击后会出现背景。↓",
                    textAlign: TextAlign.center),
                IconButton(
                  icon: Icon(Icons.trending_up),
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState.showSnackBar(SnackBar(
                      content: Text("可点击的Icon，不包括文字，默认没有背景，点击后会出现背景。"),
                    ));
                  },
                ),
                Text("自定义按钮:赞↓", textAlign: TextAlign.center),
                FlatButton.icon(
                  icon: Icon(Icons.thumb_up),
                  label: Text("自定义按钮:赞"),
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState.showSnackBar(SnackBar(
                      content: Text("自定义按钮:赞"),
                    ));
                  },
                ),
                Text("自定义圆角按钮↓", textAlign: TextAlign.center),
                RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("自定义圆角按钮"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  //正常状态下的阴影
                  elevation: 2.0,
                  //按下时的阴影
                  highlightElevation: 8.0,
                  // 禁用时的阴影
                  disabledElevation: 0.0,
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState
                        .showSnackBar(SnackBar(content: Text("自定义圆角按钮")));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
