import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowWrapper.dart';
import 'package:flutter_app/common/ListViewWrapper.dart';

///author: yang yi
///email: yangyirunning@163.com
class LayoutManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: SingleChildScrollView(
        child: getScrollBar(getLayoutWidgetList(context)),
      ),
    );
  }
}
