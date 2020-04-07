import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowWrapper.dart';

///author: yang yi
///email: yangyirunning@163.com
class GridViewMaxExtendWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GridViewMaxState();
  }
}

class GridViewMaxState extends State<GridViewMaxExtendWidget> {
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
                "GridView + SliverGridDelegateWithMaxCrossAxisExtent",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "HanyiSentySuciTablet",
                    color: Colors.blue),
              ),
            ),
            Scrollbar(
              child: GridView(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.5,
                ),
                children: getLimitListWidget(),
              ),
            )
          ],
        ));
  }
}
