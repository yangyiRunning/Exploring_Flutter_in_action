import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class CustomNotification extends Notification {
  String message;

  CustomNotification();
}

class CustomScrollNotificationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomScrollNotificationState();
  }
}

class CustomScrollNotificationState
    extends State<CustomScrollNotificationWidget> {
  final textHeightFactor = 15;
  final String msg = "你好";
  String message = "";
  int count;
  CustomNotification customNotification = new CustomNotification();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Stack(
        children: <Widget>[
          message == ""
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height /
                          textHeightFactor),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[100],
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
          Container(
            alignment: Alignment.topCenter,
            child: NotificationListener<CustomNotification>(
              child: Builder(builder: (context) {
                return RaisedButton(
                  child: Text("点击发送消息: $msg"),
                  onPressed: () {
                    customNotification.message = msg;
                    customNotification.dispatch(context);
                  },
                );
              }),
              onNotification: (notification) {
                //不阻止冒泡
                setState(() {
                  message += notification.message;
                });
                return false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
