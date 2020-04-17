import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'common/CommonNotification.dart';
import 'event/EventBusSecondWidget.dart';
import 'event/EventBusWidget.dart';
import 'function/CheckExitWidget.dart';
import 'function/FunctionWidgetManager.dart';
import 'function/ShareDataInheritedWidget.dart';
import 'function/provider/ProviderMainWidget.dart';
import 'gesture/GestureDetectorManagerWidget.dart';
import 'gesture/GestureDetectorWidget.dart';
import 'gesture/GestureRecognizerTextWidget.dart';
import 'gesture/ScaleGestureDetectorWidget.dart';
import 'io/FileIOWidget.dart';
import 'network/DioWidget.dart';
import 'network/HttpClientWidget.dart';
import 'network/NetworkManagerWidget.dart';
import 'notification/CustomScrollNotificationWidget.dart';
import 'notification/NotificationBubblingWidget.dart';
import 'notification/ScrollNotificationManagerWidget.dart';
import 'notification/ScrollNotificationWidget.dart';
import 'setting/SettingWidget.dart';
import 'theme/LocalThemeSwitchWidget.dart';
import 'theme/ThemeSwitchManagerWidget.dart';
import 'touch/TouchManagerWidget.dart';
import 'touch/TouchPadWidget.dart';
import 'touch/TouchBubbleWidget.dart';
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
void main(){
  print("当前操作系统为: $defaultTargetPlatform");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  ThemeData themeDateLight = new ThemeData(
    brightness: Brightness.light,
  );

  ThemeData themeDateDark = new ThemeData(
    brightness: Brightness.dark,
  );

  var themeData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appName = "Flutter踩坑之旅";
    return NotificationListener<AppThemeNotification>(
      onNotification: (notification) {
        if (notification.isLight) {
          setState(() {
            themeData = themeDateLight;
          });
        } else {
          setState(() {
            themeData = themeDateDark;
          });
        }
        return false;
      },
      child: MaterialApp(
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        checkerboardRasterCacheImages: false,
        checkerboardOffscreenLayers: false,
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        //应用名称
        title: "$appName",
        //应用主题
        theme: themeData,
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
          "ScaleGestureDetectorWidget": (context) =>
              ScaleGestureDetectorWidget(),
          "GestureRecognizerTextWidget": (context) =>
              GestureRecognizerTextWidget(),
          "EventBusWidget": (context) => EventBusWidget(),
          "EventBusSecondWidget": (context) => EventBusSecondWidget(),
          "ScrollNotificationManagerWidget": (context) =>
              ScrollNotificationManagerWidget(),
          "ScrollNotificationWidget": (context) => ScrollNotificationWidget(),
          "CustomScrollNotificationWidget": (context) =>
              CustomScrollNotificationWidget(),
          "NotificationBubblingWidget": (context) =>
              NotificationBubblingWidget(),
          "FileIOWidget": (context) => FileIOWidget(),
          "NetworkManagerWidget": (context) => NetworkManagerWidget(),
          "HttpClientWidget": (context) => HttpClientWidget(),
          "DioWidget": (context) => DioWidget(),
          "CheckExitWidget": (context) => CheckExitWidget(),
          "FunctionWidgetManager": (context) => FunctionWidgetManager(),
          "ShareDataInheritedWidget": (context) => ShareDataInheritedWidget(),
          "ProviderMainWidget": (context) => ProviderMainWidget(),
          "LocalThemeSwitchWidget": (context) => LocalThemeSwitchWidget(),
          "ThemeSwitchManagerWidget": (context) => ThemeSwitchManagerWidget(),
          "SettingWidget": (context) => SettingWidget(),
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
      ),
    );
  }
}
