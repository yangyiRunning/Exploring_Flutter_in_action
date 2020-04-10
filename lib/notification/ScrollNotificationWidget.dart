import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class ScrollNotificationWidget extends StatefulWidget {
  @override
  ScrollNotificationState createState() {
    // TODO: implement createState
    return ScrollNotificationState();
  }
}

class ScrollNotificationState extends State<ScrollNotificationWidget> {
  final double textHeightFactor = 15;
  String scrollStatusName = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / textHeightFactor),
            child: NotificationListener(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 == 0) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.blueAccent[100],
                        child: getLimitListWidget(100)[index],
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.orange[200],
                        child: getLimitListWidget(100)[index],
                      );
                    }
                  },
                  itemCount: getLimitListWidget(100).length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                ),
              ),
              onNotification: (notification) {
                switch (notification.runtimeType) {
                  case ScrollStartNotification:
                    print("开始滚动");
                    setState(() {
                      scrollStatusName = "开始滚动";
                    });
                    break;
                  case ScrollUpdateNotification:
                    print("正在滚动");
                    setState(() {
                      scrollStatusName = "正在滚动";
                    });
                    break;
                  case ScrollEndNotification:
                    print("滚动停止");
                    setState(() {
                      scrollStatusName = "滚动停止";
                    });
                    break;
                  case OverscrollNotification:
                    print("滚动到边界");
                    setState(() {
                      scrollStatusName = "滚动到边界";
                    });
                    break;
                }
                //不阻止冒泡
                return false;
              },
            ),
          ),
          scrollStatusName == ""
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / textHeightFactor,
                  color: Colors.blue[100],
                  child: Text(
                    scrollStatusName,
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
        ],
      ),
    );
  }
}
