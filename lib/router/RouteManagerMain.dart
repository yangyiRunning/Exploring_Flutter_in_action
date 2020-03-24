import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteManagerMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("跳转至带状态的计数器界面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "StateCounter", arguments: "到此一游");
              },
            ),
            FlatButton(
              child: Text("跳转至路由界面 NewRoute"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return NewRoute();
//                }));
                Navigator.pushNamed(context, "NewRoute");
              },
            ),
            FlatButton(
              child: Text("携带参数跳转界面 ResultRoute"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return ResultRoute();
//                }));
                Navigator.pushNamed(context, "ResultRoute");
              },
            ),
            FlatButton(
              child: Text("跳转至一个苹果风格的界面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(
                    context, "CupertinoRoute", arguments: "苹果风格的界面");
              },
            )
          ],
        ),
      ),
    );
  }

}