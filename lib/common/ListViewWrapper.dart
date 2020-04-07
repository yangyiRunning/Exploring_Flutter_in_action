import 'package:flutter/material.dart';

///author: yangyi
///email: yangyirunning@163.com

Scrollbar getScrollBar(List<FlatButton> flatButtonList) {
  return Scrollbar(
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return flatButtonList[index];
      },
      shrinkWrap: true,
      itemCount: flatButtonList.length,
      padding: EdgeInsets.all(10),
    ),
  );
}
