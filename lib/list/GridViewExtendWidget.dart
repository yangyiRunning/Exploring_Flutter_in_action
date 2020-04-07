import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowWrapper.dart';

///author: yang yi
///email: yangyirunning@163.com
class GridViewExtendWidget extends StatefulWidget {
  @override
  GridViewExtendState createState() {
    // TODO: implement createState
    return GridViewExtendState();
  }
}

class GridViewExtendState extends State<GridViewExtendWidget> {
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
              "GridView.extent",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "HanyiSentySuciTablet",
                  color: Colors.blue),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: GridView.extent(
                  maxCrossAxisExtent: 120,
                  shrinkWrap: true,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.5,
              children: getLimitListWidget()),
            ),
          )
        ],
      ),
    );
  }
}
