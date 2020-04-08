import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class DividerListViewWidget extends StatefulWidget {
  @override
  DividerListViewState createState() {
    // TODO: implement createState
    return DividerListViewState();
  }
}

class DividerListViewState extends State<DividerListViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset("assets/images/conan.jpg"),
              title: Text("item $index"),
              subtitle: Text("subtitle $index"),
              contentPadding: EdgeInsets.all(20),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("点击了第 ($index) 项目"),
                ));
              },
              onLongPress: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("长按了第 ($index) 项目"),
                ));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      height: 10,
                      color: Colors.blue,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      height: 10,
                      color: Colors.redAccent,
                    ),
                  );
          },
          itemCount: 100),
    );
  }
}
