import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowWrapper.dart';

///author: yang yi
///email: yangyirunning@163.com
class GridViewWidget extends StatefulWidget {
  @override
  GridViewState createState() {
    // TODO: implement createState
    return GridViewState();
  }
}

class GridViewState extends State<GridViewWidget> {
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
              "GridView + SliverGridDelegateWithFixedCrossAxisCount",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "HanyiSentySuciTablet",
                  color: Colors.blue),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5, //宽高比
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                children: getLimitListWidget(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
