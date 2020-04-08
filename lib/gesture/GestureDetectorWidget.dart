import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class GestureDetectorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureDetectorState();
  }
}

class GestureDetectorState extends State<GestureDetectorWidget> {
  String gestureName = "";
  double top = 0.0;
  double left = 0.0;
  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
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
                      "" + gestureName?.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            flex: 5,
            child: Container(
                child: Stack(
              children: <Widget>[
                Positioned(
                  child: GestureDetector(
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/conan.jpg",
                        width: width,
                        height: height,
                      ),
                    ),
                    onPanDown: (DragDownDetails details) {
                      setState(() {
                        gestureName =
                            "用户手指按下相对屏幕左上角的绝对坐标: ${details.globalPosition}";
                      });
                    },
                    onPanEnd: (DragEndDetails details) {
                      setState(() {
                        gestureName = "抬手时的速度: ${details.velocity}";
                      });
                    },
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        gestureName = "delta: ${details.delta}";
                        left += details.delta.dx;
                        top += details.delta.dy;
                        print(left);
                        print(top);
                      });
                    },
                  ),
                  top: top,
                  left: left,
                )
              ],
            )),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: GestureDetector(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue[100],
                    child: Text(
                      "我就是用来戳的",
                      style: TextStyle(color: Colors.black45),
                    )),
                onTap: () {
                  setState(() {
                    gestureName = "常用动作名称: 单击";
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    gestureName = "常用动作名称: 双击";
                  });
                },
                onLongPress: () {
                  setState(() {
                    gestureName = "常用动作名称: 长按";
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
