import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class StackLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: getAppBar(arg),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            //Stack高度类似于Android中的帧布局，Stack这个名字也很形象的自解释了这个布局控件的意含义
            //全屏铺满且居中
//            fit: StackFit.expand表示没有通过Positioned指定方位的"流浪控件"会填充满整个Stack布局
//            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Text(
                "居中",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
              Positioned(
                left: 20,
                child: Text(
                  "距Stack左20",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ),
              Positioned(
                top: 20,
                child: Text(
                  "距Stack顶20",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Positioned(
                right: 20,
                child: Text(
                  "距Stack右20",
                  style: TextStyle(color: Colors.amber, fontSize: 15),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Text(
                  "距Stack底20",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                ),
              ),
            ],
          ),
        ));
  }
}
