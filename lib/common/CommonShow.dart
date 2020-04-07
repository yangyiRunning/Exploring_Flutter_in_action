import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
FlatButton getFlatButton(
    BuildContext context, String text, String clazz, String pagerName) {
  return FlatButton(
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
    textColor: Colors.blue,
    onPressed: () {
      Navigator.pushNamed(context, clazz, arguments: text);
    },
  );
}

List<Widget> getLimitListWidget() {
  List<Widget> items = [];
  for (int i = 1; i <= 20; i++) {
    items.add(Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Builder(builder: (context) {
        return FlatButton(
          child: Text(
            "item $i",
            style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("item $i"),
            ));
          },
        );
      }),
    ));
  }
  return items;
}

List<FlatButton> getMainList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList
      .add(getFlatButton(context, "路由管理", "RouteManagerMain", "路由管理主界面"));
  flatButtonList
      .add(getFlatButton(context, "状态管理", "StateManagerMain", "状态管理主界面"));
  flatButtonList
      .add(getFlatButton(context, "基础控件", "BaseWidgetMain", "基础控件主界面"));
  flatButtonList
      .add(getFlatButton(context, "布局控件", "LayoutManagerWidget", "布局控件主界面"));
  flatButtonList
      .add(getFlatButton(context, "容器控件", "ContainerManagerWidget", "容器控件主界面"));
  flatButtonList
      .add(getFlatButton(context, "列表控件", "ListManagerWidget", "列表控件主界面"));

  return flatButtonList;
}

List<FlatButton> getRouterList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList.add(
      getFlatButton(context, "跳转至带状态的计数器界面", "StateCounter", "跳转至带状态的计数器界面"));
  flatButtonList
      .add(getFlatButton(context, "跳转至路由界面 NewRoute", "NewRoute", "跳转至路由界面"));
  flatButtonList.add(getFlatButton(
      context, "携带参数跳转界面 ResultRoute", "ResultRoute", "携带参数跳转界面"));
  flatButtonList.add(
      getFlatButton(context, "跳转至一个苹果风格的界面", "CupertinoRoute", "跳转至一个苹果风格的界面"));

  return flatButtonList;
}

List<FlatButton> getStateList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList.add(getFlatButton(context,
      "子Widget树获取父级StatefulWidget的State对象", "SnackBarWidget", "传个参证明我来过"));
  flatButtonList.add(FlatButton(
    child: Text("Dump App"),
    textColor: Colors.blue,
    onPressed: () {
      debugDumpApp();
    },
  ));

  return flatButtonList;
}
