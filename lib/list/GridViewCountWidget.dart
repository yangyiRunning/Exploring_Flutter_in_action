import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class GridViewCountWidget extends StatefulWidget {
  @override
  GridViewCountState createState() {
    // TODO: implement createState
    return GridViewCountState();
  }
}

class GridViewCountState extends State<GridViewCountWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "GridView.count",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "HanyiSentySuciTablet",
                  color: Colors.blue),
            ),
          ),
          Expanded(
              child: Scrollbar(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5,
              //宽高比
              children: getLimitListWidget(20),
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
            ),
          ))
        ],
      ),
    );
  }
}
