import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class CheckExitWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CheckExitState();
  }
}

class CheckExitState extends State<CheckExitWidget> {
  DateTime lastTime;
  bool prepareExit = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[100],
        child: WillPopScope(
          onWillPop: () async {
            if (lastTime == null ||
                DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
              lastTime = DateTime.now();
              return prepareExit;
            } else {
                prepareExit = true;
              return prepareExit;
            }
          },
          child: Text(
            "2秒内返回两次视为真的要退出",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
