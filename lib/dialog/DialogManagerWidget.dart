import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogManagerWidget extends StatefulWidget {
  @override
  DialogManagerState createState() {
    // TODO: implement createState
    return DialogManagerState();
  }
}

class DialogManagerState extends State<DialogManagerWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("AlertDialog"),
                onPressed: () async {
                  bool exit = await getAlertDialog();
                  //当没有手动设置返回值时等于null
                  if (exit == null) {
                    //点击了dialog外部
                    Fluttertoast.showToast(msg: "取消退出");
                  } else {
                    Fluttertoast.showToast(msg: "已确认退出");
                  }
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("SimpleDialog"),
                onPressed: ()  {
                  getSimpleDialog();
                },
              ))
        ],
      ),
    );
  }

  Future<bool> getAlertDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            titleTextStyle: TextStyle(color: Colors.blue),
            content: Text("是否确认退出？"),
            contentTextStyle: TextStyle(color: Colors.blue),
            elevation: 10,
            actions: <Widget>[
              FlatButton(
                child: getNormalBlueText("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("退出"),
                onPressed: () {
                  //pop后的返回值为true，你没有看错，关掉一个dialog的方法和关掉一个页面的方法是一样的
                  //第一个pop为关闭弹出框
                  Navigator.of(context).pop(true);
                  //第二个pop为关闭当前页面
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<bool> getSimpleDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: getNormalBlueText("国家列表"),
            children: <Widget>[
              FlatButton(
                child: getNormalBlueText("中国"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "中国");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("美国"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "美国");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("欧盟"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "欧盟");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("日本"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "日本");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("其他"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "其他");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
