import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearLayoutWidget extends StatefulWidget{
  @override
  LinearLayoutState createState() {
    // TODO: implement createState
    return LinearLayoutState();
  }

}

class LinearLayoutState extends State<LinearLayoutWidget>{
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }

}