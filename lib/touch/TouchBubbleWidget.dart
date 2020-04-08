import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class TouchBubbleWidget extends StatefulWidget {
  @override
  TouchBubbleState createState() {
    // TODO: implement createState
    return TouchBubbleState();
  }
}

class TouchBubbleState extends State<TouchBubbleWidget> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                alignment: Alignment.center,
                color: Colors.amberAccent[100],
                child: Text(
                  "按下控件的名称: $text",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Listener(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          height: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "底部控件",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.blue[100],
                        ),
                        onPointerDown: (event) {
                          setState(() {
                            text += "down 底部控件 ";
                          });
                          print("down 底部控件");
                        },
                        onPointerUp: (event) {
                          setState(() {
                            text = "";
                          });
//                        print("up 底部控件");
                        },
                      ),
                      Listener(
                        child: Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "HitTestBehavior.opaque行为演示",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
//                        color: Colors.grey[100], 深坑: 在此处设置color后，任何behavior将会失效
                        ),
                        onPointerDown: (event) {
                          setState(() {
                            text += "down 顶部控件 ";
                          });
                          print("down 顶部控件");
                        },
                        onPointerUp: (event) {
                          setState(() {
                            text = "";
                          });
//                        print("up 顶部控件");
                        },
                        behavior: HitTestBehavior.opaque, //当前控件不透明处理(哪怕其UI为透明）
                      )
                    ],
                  ),
                )),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Listener(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          height: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "底部控件",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.blue[100],
                        ),
                        onPointerDown: (event) {
                          setState(() {
                            text += "down 底部控件 ";
                          });
                          print("down 底部控件");
                        },
                        onPointerUp: (event) {
                          setState(() {
                            text = "";
                          });
//                        print("up 底部控件");
                        },
                      ),
                      Listener(
                        child: Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "HitTestBehavior.translucent行为演示",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
//                        color: Colors.grey[100], 深坑: 在此处设置color后，任何behavior将会失效
                        ),
                        onPointerDown: (event) {
                          setState(() {
                            text += "down 顶部控件 ";
                          });
                          print("down 顶部控件");
                        },
                        onPointerUp: (event) {
                          setState(() {
                            text = "";
                          });
//                        print("up 顶部控件");
                        },
                        behavior:
                            HitTestBehavior.translucent, //当前控件透明处理，直接"穿透"到最底部
                      )
                    ],
                  ),
                )),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Listener(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        width: MediaQuery.of(context).size.width,
                        height: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "底部控件",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        color: Colors.blue[100],
                      ),
                      onPointerDown: (event) {
                        setState(() {
                          text += "down 底部控件 ";
                        });
                        print("down 底部控件");
                      },
                      onPointerUp: (event) {
                        setState(() {
                          text = "";
                        });
//                        print("up 底部控件");
                      },
                    ),
                    Listener(
                      child: Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: Text(
                          "HitTestBehavior.deferToChild行为演示",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
//                        color: Colors.grey[100], 深坑: 在此处设置color后，任何behavior将会失效
                      ),
                      onPointerDown: (event) {
                        setState(() {
                          text += "down 顶部控件 ";
                        });
                        print("down 顶部控件");
                      },
                      onPointerUp: (event) {
                        setState(() {
                          text = "";
                        });
//                        print("up 顶部控件");
                      },
                      behavior:
                          HitTestBehavior.deferToChild, //顶部一旦有命中的，即视为当前控件全部命中
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    IgnorePointer(
                      child: Listener(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          height: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "底部控件",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.blue[100],
                        ),
                        onPointerDown: (event) {
                          setState(() {
                            text += "down 底部控件 ";
                          });
                          print("down 底部控件");
                        },
                        onPointerUp: (event) {
                          setState(() {
                            text = "";
                          });
//                        print("up 底部控件");
                        },
                      ),
                    ),
                    IgnorePointer(
                      child: Listener(
                        child: Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "全部事件忽略 IgnorePointer",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
//                        color: Colors.grey[100], 深坑: 在此处设置color后，任何behavior将会失效
                        ),
                        onPointerDown: (event) {
                          setState(() {
                            text += "down 顶部控件 ";
                          });
                          print("down 顶部控件");
                        },
                        onPointerUp: (event) {
                          setState(() {
                            text = "";
                          });
//                        print("up 顶部控件");
                        },
                        behavior:
                        HitTestBehavior.deferToChild, //顶部一旦有命中的，即视为当前控件全部命中
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
