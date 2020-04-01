import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("$arg"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "图片相对于外部容器位于右上角",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Container(
                color: Colors.grey,
                //align高度类似于Android中的相对布局
                child: Align(
                  //不设置宽高则会全屏显示，因为控件的宽高要尽可能的占用更多的空间
                  child: Image.asset(
                    "assets/images/conan.jpg",
                    width: 100,
                    height: 100,
                  ),
                  //容器控件的最终大小为: width = 100 * 2; height = 100 * 2;
                  widthFactor: 2,
                  heightFactor: 2,
                  //图片相对于容器居于右上角
                  alignment: Alignment.topRight,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Alignment(x,y): 以屏幕中央的中心点为坐标原点",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Text(
                "Alignment实际偏移 = (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Container(
                color: Colors.grey,
                child: Align(
                  child: Image.asset(
                    "assets/images/conan.jpg",
                    width: 150,
                    height: 150,
                  ),
                  widthFactor: 2,
                  heightFactor: 2,
                  //以屏幕中心点为坐标原点
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "FractionalOffset(x,y): 以屏幕左上角的原点为坐标原点",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Text(
                "FractionalOffset实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Container(
                color: Colors.grey,
                child: Align(
                  child: Image.asset(
                    "assets/images/conan.jpg",
                    width: 150,
                    height: 150,
                  ),
                  widthFactor: 2.0,
                  heightFactor: 2.0,
                  alignment: FractionalOffset(0.0, 0.0),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "继承自Align的Center，自动实现了Alignment.center",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Container(
                color: Colors.grey,
                child: Center(
                  child: Image.asset(
                    "assets/images/conan.jpg",
                    width: 150,
                    height: 150,
                  ),
                  widthFactor: 2.0,
                  heightFactor: 2.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
