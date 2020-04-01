import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("$arg"),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Padding(
                  child: Text(
                    "左上右下都填充30",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  padding: EdgeInsets.all(30),
                ),
              ),
              Container(
                color: Colors.grey,
                child: Padding(
                  child: Text(
                    "左上右下分别设置填充",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 10, 50, 20),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: Padding(
                  child: Text(
                    "只对其中的一个方向(上)设置填充",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  padding: EdgeInsets.only(top: 40),
                ),
              ),
              Container(
                color: Colors.greenAccent,
                child: Padding(
                  child: Text(
                    "设置垂直和水平两个方向的对称的填充",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                ),
              ),
            ],
          ),
        )));
  }
}
