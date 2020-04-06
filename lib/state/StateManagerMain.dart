import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class StateManagerMain extends StatelessWidget {
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
              child: Text("子Widget树获取父级StatefulWidget的State对象"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "SnackBarWidget",
                    arguments: "传个参证明我来过");
              },
            ),
            FlatButton(
              child: Text("Dump App"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpApp();
              },
            )
          ],
        ),
      ),
    );
  }
}
