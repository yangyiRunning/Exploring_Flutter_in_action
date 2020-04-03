import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Container(
        //容器外填充
        margin: EdgeInsets.only(top: 50.0, left: 120.0),
        //容器内填充
        padding: EdgeInsets.all(20),
        //卡片大小
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
        //背景装饰
        decoration: BoxDecoration(
            //背景径向渐变
            gradient: RadialGradient(
                colors: [Colors.red, Colors.blue],
                center: Alignment.center,
                radius: .98),
            //卡片阴影
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(2.0, 2.0), blurRadius: 4.0)
            ]),
        //卡片倾斜变换
        transform: Matrix4.rotationZ(0.5),
        //卡片内文字居中
        alignment: Alignment.center,
        //卡片文字
        child: Text(
          "Container是所有容器类控件的组合",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
