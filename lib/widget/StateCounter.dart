import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateCounterWidget extends StatefulWidget {
  final int initValue;

  const StateCounterWidget({Key key, this.initValue = 0});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterState();
  }
}

class CounterState extends State<StateCounterWidget> {
  int count;
  var arg;

  //构建Widget子树时调用
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("带状态的计数器"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("$arg"),
            Text("$count"),
            RaisedButton(
              child: Text("点击此按钮自增1"),
              onPressed: () {
                setState(() {
                  count++;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  //当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  //在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  //在在新旧widget的key和runtimeType同时相等时调用
  @override
  void didUpdateWidget(StateCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  //当Widget第一次插入到Widget树时会被调用
  @override
  void initState() {
    super.initState();
    count = widget.initValue;
    print("initState");
  }
}
