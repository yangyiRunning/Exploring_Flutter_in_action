import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class TipRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final text = ModalRoute
        .of(context)
        .settings
        .arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("带参数的路由页面 TipRoute"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, "结束页面时的返回值");
              },
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}
