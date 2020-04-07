import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShow.dart';

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
        body: Scrollbar(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return getStateList(context)[index];
            },
            shrinkWrap: true,
            itemCount: getStateList(context).length,
            padding: EdgeInsets.all(10),
          ),
        ));
  }
}
