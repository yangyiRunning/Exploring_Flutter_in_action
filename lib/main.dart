import 'package:flutter/material.dart';
import 'event/EventBusSecondWidget.dart';
import 'event/EventBusWidget.dart';
import 'gesture/GestureDetectorManagerWidget.dart';
import 'gesture/GestureDetectorWidget.dart';
import 'gesture/GestureRecognizerTextWidget.dart';
import 'gesture/ScaleGestureDetectorWidget.dart';
import 'notification/ScrollNotificationManagerWidget.dart';
import 'notification/ScrollNotificationWidget.dart';
import 'touch/TouchManagerWidget.dart';
import 'touch/TouchPadWidget.dart';
import 'touch/TouchBubbleWidget.dart';
import 'common/CommonShowModel.dart';
import 'container/BoxContainerWidget.dart';
import 'container/ClipWidget.dart';
import 'container/ContainerManagerWidget.dart';
import 'container/ContainerWidget.dart';
import 'container/DecoratedBoxWidget.dart';
import 'container/PaddingContainerWidget.dart';
import 'container/TabBarViewWidget.dart';
import 'container/TransformWidget.dart';
import 'list/DividerListViewWidget.dart';
import 'list/GridViewCountWidget.dart';
import 'list/GridViewExtendWidget.dart';
import 'list/GridViewMaxExtendWidget.dart';
import 'list/GridViewWidget.dart';
import 'list/LimitListViewWidget.dart';
import 'list/ListManagerWidget.dart';
import 'list/ListViewScrollControllerWidget.dart';
import 'list/LoadingMordAndRefreshListViewWidget.dart';
import 'list/MultitudinousListViewWidget.dart';
import 'list/UnLimitGridViewWidget.dart';
import 'router/RouteManagerMain.dart';
import 'state/StateManagerMain.dart';
import 'widget/BaseWidgetMain.dart';
import 'widget/ButtonWidget.dart';
import 'widget/EditTextFormWidget.dart';
import 'widget/IconWidget.dart';
import 'widget/LoginFormWidget.dart';
import 'widget/ProgressBarWidget.dart';
import 'widget/RandomWordWidget.dart';
import 'router/CupertinoRoute.dart';
import 'router/NewRoute.dart';
import 'router/ResultRoute.dart';
import 'router/TipRoute.dart';
import 'state/SnackBarWidget.dart';
import 'router/StateCounterWidget.dart';
import 'widget/SwitchCheckboxWidget.dart';
import 'widget/TextStyleWidget.dart';

import 'layout/AlignLayoutWidget.dart';
import 'layout/FlexLayoutWidget.dart';
import 'layout/StackLayoutWidget.dart';
import 'layout/WrapLayoutWidget.dart';
import 'layout/LayoutManagerWidget.dart';
import 'layout/LinearLayoutWidget.dart';

///author: yang yi
///email: yangyirunning@163.com
void main() {
  //是否开启布局边界
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appName = "Flutter踩坑之旅";
    return MaterialApp(
      //应用名称
      title: "$appName",
      //应用主题
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "NewRoute": (context) => NewRoute(),
        "ResultRoute": (context) => ResultRoute(),
        "TipRoute": (context) => TipRoute(),
        "RandomWord": (context) => RandomWord(),
        "StateCounter": (context) => StateCounterWidget(),
        "SnackBarWidget": (context) => SnackBarWidget(),
        "CupertinoRoute": (context) => CupertinoRoute(),
        "RouteManagerMain": (context) => RouteManagerMain(),
        "StateManagerMain": (context) => StateManagerMain(),
        "BaseWidgetMain": (context) => BaseWidgetMain(),
        "TextStyleWidget": (context) => TextStyleWidget(),
        "ButtonWidget": (context) => ButtonWidget(),
        "IconWidget": (context) => IconWidget(),
        "SwitchCheckboxWidget": (context) => SwitchCheckboxWidget(),
        "EditTextFormWidget": (context) => EditTextFormWidget(),
        "LoginFormWidget": (context) => LoginFormWidget(),
        "ProgressBarWidget": (context) => ProgressBarWidget(),
        "LayoutManagerWidget": (context) => LayoutManagerWidget(),
        "LinearLayoutWidget": (context) => LinearLayoutWidget(),
        "FlexLayoutWidget": (context) => FlexLayoutWidget(),
        "WrapLayoutWidget": (context) => WrapLayoutWidget(),
        "StackLayoutWidget": (context) => StackLayoutWidget(),
        "AlignLayoutWidget": (context) => AlignLayoutWidget(),
        "ContainerManagerWidget": (context) => ContainerManagerWidget(),
        "PaddingContainerWidget": (context) => PaddingContainerWidget(),
        "BoxContainerWidget": (context) => BoxContainerWidget(),
        "DecoratedBoxWidget": (context) => DecoratedBoxWidget(),
        "TransformWidget": (context) => TransformWidget(),
        "ContainerWidget": (context) => ContainerWidget(),
        "ClipWidget": (context) => ClipWidget(),
        "TabBarViewWidget": (context) => TabBarViewWidget(),
        "ListManagerWidget": (context) => ListManagerWidget(),
        "LimitListViewWidget": (context) => LimitListViewWidget(),
        "MultitudinousListViewWidget": (context) =>
            MultitudinousListViewWidget(),
        "DividerListViewWidget": (context) => DividerListViewWidget(),
        "LoadingMordAndRefreshListViewWidget": (context) =>
            LoadingMordAndRefreshListViewWidget(),
        "GridViewWidget": (context) => GridViewWidget(),
        "GridViewCountWidget": (context) => GridViewCountWidget(),
        "GridViewMaxExtendWidget": (context) => GridViewMaxExtendWidget(),
        "GridViewExtendWidget": (context) => GridViewExtendWidget(),
        "UnLimitGridViewWidget": (context) => UnLimitGridViewWidget(),
        "ListViewScrollControllerWidget": (context) =>
            ListViewScrollControllerWidget(),
        "TouchPadWidget": (context) => TouchPadWidget(),
        "TouchManagerWidget": (context) => TouchManagerWidget(),
        "TouchBubbleWidget": (context) => TouchBubbleWidget(),
        "GestureDetectorWidget": (context) => GestureDetectorWidget(),
        "GestureDetectorManagerWidget": (context) =>
            GestureDetectorManagerWidget(),
        "ScaleGestureDetectorWidget": (context) => ScaleGestureDetectorWidget(),
        "GestureRecognizerTextWidget": (context) =>
            GestureRecognizerTextWidget(),
        "EventBusWidget": (context) => EventBusWidget(),
        "EventBusSecondWidget": (context) => EventBusSecondWidget(),
        "ScrollNotificationManagerWidget": (context) =>
            ScrollNotificationManagerWidget(),
        "ScrollNotificationWidget": (context) => ScrollNotificationWidget(),
      },
      //路由生成的钩子
//      onGenerateRoute: (RouteSettings settings) {
//        return MaterialPageRoute(builder: (context) {
//          String routeName = settings.name;
//          //如果访问的路由页面需要登录，而当前未登录，则直接返回登录页面的路由
//          //引导用户的登录，其他情况则正常打开路由页面
//
//        });
//      },
      //应用首页面
      home: MyHomePage(title: "$appName"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //状态自增函数
  void _incrementCounter() {
    //通知flutter框架，有状态发生了改变，flutter框架收到通知后，会执行build方法根据新的状态重新构建界面
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1.5,
          ),
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          itemCount: getMainList(context).length,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.amberAccent[100],
                  child: getMainList(context)[index],
                ),
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.deepPurple[100],
                  child: getMainList(context)[index],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
