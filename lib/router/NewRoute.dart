import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: getAppBar(arg),
      body: new Center(
        child: new Text("我把界面的内容放在中间"),
      ),
    );
  }
}