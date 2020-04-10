import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:flutter_app/notification/CustomScrollNotificationWidget.dart';

class NotificationBubblingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotificationBubblingState();
  }
}

class NotificationBubblingState extends State<NotificationBubblingWidget> {
  final textHeightFactor = 15;
  String message = "";
  CustomNotification customNotification = new CustomNotification();
  bool childIntercept = false;
  bool parentIntercept = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Column(
        children: <Widget>[
          Expanded(
            child: message == ""
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue[100],
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black45,fontSize: 20),
                    ),
                  ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / textHeightFactor,
            child: NotificationListener<CustomNotification>(
              onNotification: (notification) {
                setState(() {
                  message += "父节点接收到;";
                });
                print("父节点接收到;");
                return parentIntercept;
              },
              child: NotificationListener<CustomNotification>(
                onNotification: (notification) {
                  setState(() {
                    message += "子节点接收到;";
                  });
                  print("子节点接收到;");
                  return childIntercept;
                },
                child: Builder(builder: (context) {
                  return RaisedButton(
                    child: Text("子父节点冒泡打印按钮"),
                    onPressed: () {
                      customNotification.dispatch(context);
                    },
                  );
                }),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text(
                          childIntercept ? "子节点允许冒泡(打印父)" : "子节点阻止冒泡(不打印父)"),
                      onPressed: () {
                        setState(() {
                          childIntercept = !childIntercept;
                          customNotification.dispatch(context);
                        });
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text(parentIntercept
                          ? "父节点允许冒泡(打印子和父)"
                          : "父节点阻止冒泡(打印子和父)"),
                      onPressed: () {
                        setState(() {
                          parentIntercept = !parentIntercept;
                          customNotification.dispatch(context);
                        });
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text("清除内容"),
                      onPressed: () {
                        setState(() {
                          message = "";
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
