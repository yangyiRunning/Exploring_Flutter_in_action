import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com

AppBar getAppBar(String text) {
  return AppBar(
    title: Text(text),
  );
}

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

List<Widget> getLimitListWidget(int count) {
  List<Widget> items = [];
  for (int i = 1; i <= count; i++) {
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
  flatButtonList
      .add(getFlatButton(context, "事件处理", "TouchManagerWidget", "事件处理主界面"));
  flatButtonList.add(getFlatButton(
      context, "手势识别", "GestureDetectorManagerWidget", "手势识别主界面"));
  flatButtonList
      .add(getFlatButton(context, "事件总线", "EventBusWidget", "事件总线主界面"));
  flatButtonList.add(
      getFlatButton(context, "通知", "ScrollNotificationManagerWidget", "通知主界面"));

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

List<FlatButton> getBaseWidgetList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList.add(FlatButton(
    child: Text("生成一串英文的随机字符串和加载一张图片"),
    textColor: Colors.blue,
    onPressed: () {
      Navigator.pushNamed(context, "RandomWord");
    },
  ));
  flatButtonList
      .add(getFlatButton(context, "文本控件，字体样式", "TextStyleWidget", "文本控件，字体样式"));
  flatButtonList.add(getFlatButton(context, "按钮系列", "ButtonWidget", "按钮系列"));
  flatButtonList.add(getFlatButton(context, "图片系列", "IconWidget", "图片系列"));
  flatButtonList.add(
      getFlatButton(context, "单选开关和复选框", "SwitchCheckboxWidget", "单选开关和复选框"));
  flatButtonList
      .add(getFlatButton(context, "输入框和表单", "EditTextFormWidget", "输入框和表单"));
  flatButtonList.add(getFlatButton(context, "登录表单", "LoginFormWidget", "登录表单"));
  flatButtonList
      .add(getFlatButton(context, "各种进度条", "ProgressBarWidget", "各种进度条"));

  return flatButtonList;
}

List<FlatButton> getLayoutWidgetList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList
      .add(getFlatButton(context, "线性布局", "LinearLayoutWidget", "线性布局"));
  flatButtonList
      .add(getFlatButton(context, "弹性布局", "FlexLayoutWidget", "弹性布局"));
  flatButtonList
      .add(getFlatButton(context, "流式布局", "WrapLayoutWidget", "流式布局"));
  flatButtonList
      .add(getFlatButton(context, "层叠布局", "StackLayoutWidget", "层叠布局"));
  flatButtonList
      .add(getFlatButton(context, "对齐与相对定位", "AlignLayoutWidget", "对齐与相对定位"));

  return flatButtonList;
}

List<FlatButton> getContainerWidgetList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList
      .add(getFlatButton(context, "填充", "PaddingContainerWidget", "填充"));
  flatButtonList
      .add(getFlatButton(context, "尺寸限制", "BoxContainerWidget", "尺寸限制"));
  flatButtonList.add(getFlatButton(context, "装饰", "DecoratedBoxWidget", "装饰"));
  flatButtonList.add(getFlatButton(context, "变换", "TransformWidget", "变换"));
  flatButtonList.add(getFlatButton(context, "容器", "ContainerWidget", "容器"));
  flatButtonList.add(getFlatButton(context, "裁减", "ClipWidget", "裁减"));
  flatButtonList.add(
      getFlatButton(context, "通用新闻类的导航主界面", "TabBarViewWidget", "通用新闻类的导航主界面"));

  return flatButtonList;
}

List<FlatButton> getFlatButtonList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList.add(getFlatButton(context, "有限列表项情况下使用ListView",
      "LimitListViewWidget", "有限列表项情况下使用ListView"));

  flatButtonList.add(getFlatButton(context, "众多列表项情况下使用ListView",
      "MultitudinousListViewWidget", "众多列表项情况下使用ListView"));

  flatButtonList.add(getFlatButton(context, "有分割线列表项情况下使用ListView",
      "DividerListViewWidget", "有分割线列表项情况下使用ListView"));

  flatButtonList.add(getFlatButton(context, "下拉刷新和上拉加载更多",
      "LoadingMordAndRefreshListViewWidget", "下拉刷新和上拉加载更多"));

  flatButtonList.add(getFlatButton(
      context,
      "网格布局(SliverGridDelegateWithFixedCrossAxisCount)",
      "GridViewWidget",
      "网格布局(SliverGridDelegateWithFixedCrossAxisCount)界面"));

  flatButtonList.add(getFlatButton(context, "网格布局(GridView.count)",
      "GridViewCountWidget", "网格布局(GridView.count)界面"));

  flatButtonList.add(getFlatButton(
      context,
      "网格布局(GridView + SliverGridDelegateWithMaxCrossAxisExtent)",
      "GridViewMaxExtendWidget",
      "网格布局(GridView + SliverGridDelegateWithMaxCrossAxisExtent)界面"));

  flatButtonList.add(getFlatButton(context, "网格布局(GridView.extent)",
      "GridViewExtendWidget", "网格布局(GridView.extent)界面"));

  flatButtonList.add(getFlatButton(context, "无限加载网格布局(GridView.builder)",
      "UnLimitGridViewWidget", "无限加载网格布局(GridView.builder)界面"));

  flatButtonList.add(getFlatButton(context, "列表滚动监听(以ListView为例)",
      "ListViewScrollControllerWidget", "列表滚动监听(以ListView为例)"));

  return flatButtonList;
}

List<FlatButton> getTouchWidgetList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList.add(getFlatButton(context, "触摸板", "TouchPadWidget", "触摸板"));
  flatButtonList.add(getFlatButton(
      context, "不同事件冒泡行为之比较", "TouchBubbleWidget", "不同事件冒泡行为之比较"));

  return flatButtonList;
}

List<FlatButton> getGestureDetectorWidgetList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList
      .add(getFlatButton(context, "手势识别演示", "GestureDetectorWidget", "手势识别演示"));
  flatButtonList.add(
      getFlatButton(context, "缩放演示", "ScaleGestureDetectorWidget", "缩放演示"));
  flatButtonList.add(getFlatButton(
      context, "GestureRecognizer演示", "GestureRecognizerTextWidget", "缩放演示"));

  return flatButtonList;
}

List<FlatButton> getNotificationWidgetList(BuildContext context) {
  List<FlatButton> flatButtonList = [];

  flatButtonList.add(
      getFlatButton(context, "通知事件名称", "ScrollNotificationWidget", "通知事件名称演示"));
  flatButtonList.add(
      getFlatButton(context, "自定义通知", "CustomScrollNotificationWidget", "自定义通知演示"));

  return flatButtonList;
}
