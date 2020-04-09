import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:flutter_app/event/EventBus.dart';

class EventBusWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventBusState();
  }
}

class EventBusState extends State<EventBusWidget> {
  String text = "这里显示参数";
  bool hasArg = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    bus.add("arg", (arg) {
      if (mounted) {
        setState(() {
          hasArg = true;
        });
      }
    });
    return Scaffold(
      appBar: getAppBar(arg),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              hasArg ? "有" : "无",
              style: TextStyle(color: Colors.blue),
            ),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("点击进入EventBus二级界面"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 2.0,
              highlightElevation: 8.0,
              disabledElevation: 0.0,
              onPressed: () {
                Navigator.pushNamed(context, "EventBusSecondWidget",
                    arguments: "EventBus二级界面");
              },
            )
          ],
        ),
      ),
    );
  }
}
