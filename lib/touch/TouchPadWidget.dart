import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowWrapper.dart';

/// author: yang yi
/// email: yangyirunning@163.com
class TouchPadWidget extends StatefulWidget {
  @override
  TouchPadState createState() {
    // TODO: implement createState
    return TouchPadState();
  }
}

class TouchPadState extends State<TouchPadWidget> {
  PointerEvent event;
  bool isShowPointer = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar("$arg"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                alignment: Alignment.center,
                color: Colors.amberAccent[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "绝对坐标:" + event?.position.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "变化量:" + event?.delta.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "按压力度:" + event?.pressure.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "指针移动方向:" + event?.orientation.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Listener(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey[350],
                      child: Text(
                        "触摸界面",
                        style: TextStyle(fontSize: 20, color: Colors.black38),
                      ),
                    ),
                    onPointerDown: (PointerDownEvent event) {
                      print("手指按下");
                      setState(() {
                        isShowPointer = true;
                        print("isShowPointer: $isShowPointer");
                        this.event = event;
                      });
                    },
                    onPointerMove: (PointerMoveEvent event) {
                      print("手指移动");
                      setState(() {
                        isShowPointer = true;
                        print("isShowPointer: $isShowPointer");
                        this.event = event;
                      });
                    },
                    onPointerUp: (PointerUpEvent event) {
                      print("手指抬起");
                      isShowPointer = false;
                      print("isShowPointer: $isShowPointer");
                    },
                    onPointerCancel: (PointerCancelEvent event) {
                      print("手指取消");
                      setState(() {
                        isShowPointer = false;
                        print("isShowPointer: $isShowPointer");
                        this.event = event;
                      });
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }
}
