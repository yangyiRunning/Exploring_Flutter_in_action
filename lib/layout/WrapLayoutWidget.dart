import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class WrapLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              //超出屏幕显示范围会自动折行的布局称为流式布局
              Wrap(
                children: <Widget>[Text("我爱coding." * 50)],
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 10, // 主轴(水平)方向间距
                runSpacing: 15, // 纵轴（垂直）方向间距
                runAlignment: WrapAlignment.center, //沿主轴方向居中
                children: <Widget>[
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("我")),
                    label: new Text("坚忍"),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("里")),
                    label: new Text("忠贞"),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("个")),
                    label: new Text("团结"),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("去")),
                    label: new Text("进取"),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("哎")),
                    label: new Text("始惊"),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("呦")),
                    label: new Text("次醉"),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("喂")),
                    label: new Text("终狂"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: <Widget>[
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.green,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.brown,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.purple,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      //遍历每一个child当中的控件，进行宽度累加。一行的宽度 = 左外填充 + 当前控件的宽度 + 右外填充
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        //如果没有超出屏幕中一行的宽度，通过矩阵的方法进行平移绘制
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        //每个child控件从左开始绘制时的坐标位置
        x = w + margin.left;
      } else {
        //如果超出了屏幕中一行的宽度，记录子child控件从左开始绘制时的初始位置
        x = margin.left;
        //换行，并加入上外填充和下外填充
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        //通过矩阵的方法进行平移绘制
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        //累加宽度。一行的宽度 = 左外填充 + 当前控件的宽度 + 右外填充
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的固定大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    //当老委派不等于现在时，重绘
    return oldDelegate != this;
  }
}
