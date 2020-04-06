import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShow.dart';

///author: yang yi
///email: yangyirunning@163.com
class LimitListViewWidget extends StatefulWidget {
  @override
  LimitListViewState createState() {
    // TODO: implement createState
    return LimitListViewState();
  }
}

class LimitListViewState extends State<LimitListViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      //不启用sliver延迟构建机制，即一次性将所有item绘制出来，本质上与SingleChildScrollView相同，只适用于少量item时
      body: Scrollbar(
        child: ListView(
          padding: EdgeInsets.all(10),
          //列表的item长度即为总长度
          shrinkWrap: true,
          children: getLimitListWidget(),
        ),
      ),
    );
  }
}