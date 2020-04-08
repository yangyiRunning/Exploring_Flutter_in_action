import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class BoxContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            //受约束的盒子，可以限制最小宽度、最大宽度，最小高度、最大高度等
            ConstrainedBox(
              constraints:
                  //设置最小高度是80，最小宽度无穷大。当设置的最小高度<80时，按照80绘制
                  BoxConstraints(minWidth: double.infinity, minHeight: 80),
              child: Container(
                child: Center(
                  child: Text(
                    "最小高度为80，<80无效",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
                //子控件此处给自己设置的10的高度不起作用，因为父控件"命令"你最小是80
                height: 10,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Container(
                color: Colors.blue,
                //因为父控件已经设置了固定高度，所以此处的高度设定无效
                height: 10,
                child: Center(
                  child: Text(
                    "固定宽高150",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 150, minHeight: 150, maxHeight: 150, maxWidth: 150),
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "固定宽高的另一种等价写法",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90, minHeight: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60, minHeight: 80),
                child: DecoratedBox(
                  //多重限制时min取最大值，minWidth: 90, minHeight: 80
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
                //父
                //原本最终的限制应该为 minWidth: 90.0, minHeight: 100.0
                //UnconstrainedBox“去除”父级限制最终显示的红色区域为 minWidth: 90.0, minHeight: 20.0，但上方仍然有80的空白空间
                //因为: 父ConstrainedBox是作用于子UnconstrainedBox上，而DecoratedBox只受子ConstrainedBox限制
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
