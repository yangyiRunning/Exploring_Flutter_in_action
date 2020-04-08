import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class LinearLayoutWidget extends StatefulWidget {
  @override
  LinearLayoutState createState() {
    // TODO: implement createState
    return LinearLayoutState();
  }
}

class LinearLayoutState extends State<LinearLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar(arg),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "线性水平居中",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "大小相等",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "默认水平方向最大宽度",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                //当设置为MainAxisSize.min时，mainAxisAlignment属性无意义
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "线性水平居中",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text(
                    "大小不等",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                  Text(
                    "所有子组件占用的的水平空间",
                    style: TextStyle(fontSize: 10, color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "线性水平靠左",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "大小相等",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "水平方向最大宽度",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text(
                    "线性水平靠左(右起始书写)",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "大小相等",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "水平方向最大宽度",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                //crossAxisAlignment的参考系是verticalDirection
                crossAxisAlignment: CrossAxisAlignment.start,
                //纵轴方向自上至下
                verticalDirection: VerticalDirection.down,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "线性水平靠左(纵轴从上到下)",
                    style: TextStyle(fontSize: 8, color: Colors.red),
                  ),
                  Text(
                    "大小相等",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  Text(
                    "水平方向最大宽度",
                    style: TextStyle(fontSize: 10, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                //crossAxisAlignment的参考系是verticalDirection
                crossAxisAlignment: CrossAxisAlignment.start,
                //纵轴方向自下至上
                verticalDirection: VerticalDirection.up,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "线性水平靠左(纵轴从下到上)",
                    style: TextStyle(fontSize: 8, color: Colors.red),
                  ),
                  Text(
                    "大小相等",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  Text(
                    "水平方向最大宽度",
                    style: TextStyle(fontSize: 10, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                //主轴和纵轴方向正好与水平线性布局的主轴纵轴方向相反
                //Row和Column都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Text("线性垂直靠左",
                      style: TextStyle(fontSize: 8, color: Colors.red)),
                  Text("主轴居中",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  Text("纵轴从左至右",
                      style: TextStyle(fontSize: 10, color: Colors.blue)),
                  Text("高度为4个Text高度之和",
                      style: TextStyle(fontSize: 15, color: Colors.amber)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                //主轴和纵轴方向正好与水平线性布局的主轴纵轴方向相反
                //Row和Column都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Text("线性垂直居中",
                      style: TextStyle(fontSize: 8, color: Colors.red)),
                  Text("主轴居中",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  Text("纵轴居中",
                      style: TextStyle(fontSize: 10, color: Colors.blue)),
                  Text("高度为4个Text高度之和",
                      style: TextStyle(fontSize: 15, color: Colors.amber)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("线性垂直居中",
                        style: TextStyle(fontSize: 8, color: Colors.red)),
                    Text("纵轴居中",
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    Text("高度为4个Text高度之和",
                        style: TextStyle(fontSize: 15, color: Colors.blue)),
                    Text("宽度为屏幕的宽度",
                        style: TextStyle(fontSize: 12, color: Colors.amber)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
