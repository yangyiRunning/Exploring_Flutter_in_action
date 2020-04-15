import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

import 'InheritedProvider.dart';

/// author: yang yi
/// email: yangyirunning@163.com
/// 状态管理: 获取provider中存放的状态并更新
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;

  ChangeNotifierProvider({Key key, this.child, this.data});

  static InheritedProvider<T> getDependOnProvider<T>(BuildContext context,
      {bool isDependOn = true}) {
    //可选参数isDependOn，是否对InheritedWidget产生依赖，默认为true。
    //依赖对应dependOnInheritedWidgetOfExactType
    //不依赖对应getElementForInheritedWidgetOfExactType
    final provider = isDependOn
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.findAncestorWidgetOfExactType<InheritedProvider<T>>();
    return provider;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangeNotifierProviderState<T>();
  }
}

class ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue[100],
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: InheritedProvider<T>(
        data: widget.data,
        child: widget.child,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //此处的widget是State<ChangeNotifierProvider>中的ChangeNotifierProvider
    //此处的data是ChangeNotifierProvider当中的泛型数据T，同时T又被限制为ChangeNotifier的子类
    widget.data.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.data.removeListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("子控件对InheritedWidget的依赖状态发生改变时调用didChangeDependencies");
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(() {
        setState(() {});
      });
      widget.data.addListener(() {
        setState(() {});
      });
    }
  }
}
