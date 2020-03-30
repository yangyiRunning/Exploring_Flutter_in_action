import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              FlatButton(
                child: Text("线性布局"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("LinearLayoutWidget", arguments: "线性布局");
                },
              ),
              FlatButton(
                child: Text("弹性布局"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("FlexLayoutWidget", arguments: "弹性布局");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
