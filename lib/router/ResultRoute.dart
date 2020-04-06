import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class ResultRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
//            result = await Navigator.push(context,
//                MaterialPageRoute(builder: (context) {
//              return new TipRoute(text: "进入时传递的参数");
//            }));
            final result = await Navigator.pushNamed(context, "TipRoute",
                arguments: "进入时传递的参数");
            print("路由返回值:" + result);
          },
          child: Text("打开提示页面"),
        ),
      ),
    );
  }
}