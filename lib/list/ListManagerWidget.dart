import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListManagerWidget extends StatelessWidget{
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
              FlatButton(
                child: Text("有限列表项情况下使用ListView"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "LimitListViewWidget",
                      arguments: "有限列表项情况下使用ListView");
                },
              ),
              FlatButton(
                child: Text("众多列表项情况下使用ListView"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "MultitudinousListViewWidget",
                      arguments: "众多列表项情况下使用ListView");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}