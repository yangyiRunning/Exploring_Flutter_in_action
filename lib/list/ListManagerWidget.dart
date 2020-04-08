import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class ListManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: getAppBar(arg),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return getFlatButtonList(context)[index];
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
            itemCount: getFlatButtonList(context).length));
  }
}