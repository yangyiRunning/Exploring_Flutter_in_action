import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text(
                        "原始文本效果",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      //矩阵变化时发生在绘制时，而无需重新布局和构建
                      transform: Matrix4.skewY(0.3),
                      alignment: FractionalOffset.center,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "左上角原点系，Y轴错切0.3",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      //矩阵变化时发生在绘制时，而无需重新布局和构建
                      transform: Matrix4.skewY(0.3),
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "屏幕中心原点系，Y轴错切0.3",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.translationValues(40, 60, 0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "左上角原点系，横移40竖移60",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.translationValues(40, 60, 0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "屏幕中心原点系，横移40竖移60",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationX(90),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "左上角原点系，x轴方向旋转90度",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(90),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "屏幕中心原点系，x轴方向旋转90度",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationY(90),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "左上角原点系，y轴方向旋转90度",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(90),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "屏幕中心原点系，y轴方向旋转90度",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationZ(90),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "左上角原点系，Z轴方向旋转90度",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(90),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "屏幕中心原点系，Z轴方向旋转90度",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Transform.scale(
                      alignment: FractionalOffset.center,
                      scale: 0.5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "左上角原点系，缩小为原来的一半",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform.scale(
                      alignment: Alignment.center,
                      scale: 0.5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "屏幕中心原点系，缩小为原来的一半",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(
                          "布局阶段旋转90度，真正改变了UI控件的大小和方向，而不仅仅是在视觉上",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
