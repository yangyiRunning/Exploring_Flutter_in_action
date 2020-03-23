import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SnackBarState();
  }
}

class SnackBarState extends State<SnackBarWidget> {
  var arg;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("$arg"),
        ),
        //注意此处一定得有个Builder包装，且通过命名参数显式的传递一个上下文参数，否则会报"does not contain a Scaffold"
        //https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text("子widget树获取父级别state对象，进而用获取的对象调用父级别类中的方法"),
                  Text("以下按钮其实是调用一个父类级别的state类中的show方法，显示一个snackbar"),
                  RaisedButton(
                    child: Text("弹出一个snackbar"),
                    onPressed: () {
                      ScaffoldState scaffoldState =
                          context.findAncestorStateOfType<ScaffoldState>();
                      scaffoldState.showSnackBar(SnackBar(
                        content: Text("这是一个snackbar"),
                      ));
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
