import 'package:flutter/cupertino.dart';

///author: yang yi
///email: yangyirunning@163.com
///状态管理: 存放状态
class InheritedProvider<T> extends InheritedWidget {
  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //每次更新都会调用子控件的didChangeDependencies周期函数
    return true;
  }
}
