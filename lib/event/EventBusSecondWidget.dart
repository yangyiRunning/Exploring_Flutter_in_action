import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:flutter_app/event/EventBus.dart';

class EventBusSecondWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventBusSecondState();
  }

}

class EventBusSecondState extends State<EventBusSecondWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("发送事件"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
          elevation: 2.0,
          highlightElevation: 8.0,
          disabledElevation: 0.0,
          onPressed: () {
            bus.post(true);
            Navigator.pop(context, "EventBusSecondWidget");
          },
        ),
      ),
    );
  }

}