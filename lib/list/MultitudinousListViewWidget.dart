import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class MultitudinousListViewWidget extends StatefulWidget {
  @override
  MultitudinousListViewState createState() {
    // TODO: implement createState
    return MultitudinousListViewState();
  }
}

class MultitudinousListViewState extends State<MultitudinousListViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      //启用sliver延迟加载模式，即第一次时只加载一部分item(具体加载多少根据开发者的设定而定)，伴随着手指的上滑，当item真正别显示的时候再创建
      //适用于item数比较多的情况
      body: Scrollbar(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.asset("assets/images/conan.jpg"),
                title: Text("item $index"),
                subtitle: Text("subtitle $index"),
                contentPadding: EdgeInsets.all(20),
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("点击了第 ($index) 项目"),
                  ));
                },
                onLongPress: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("长按了第 ($index) 项目"),
                  ));
                },
              );
            },
            //列表项数量为100个，当不设置这个参数或者这个参数设置为null时，为无限个
            itemCount: 100),
      ),
    );
  }
}
