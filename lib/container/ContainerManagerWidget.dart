import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerManagerWidget extends StatelessWidget{
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
                child: Text("填充"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("PaddingContainerWidget", arguments: "填充");
                },
              ),
              FlatButton(
                child: Text("尺寸限制"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("BoxContainerWidget", arguments: "尺寸限制");
                },
              ),
              FlatButton(
                child: Text("装饰"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("DecoratedBoxWidget", arguments: "装饰");
                },
              ),
              FlatButton(
                child: Text("变换"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("TransformWidget", arguments: "变换");
                },
              ),
              FlatButton(
                child: Text("容器"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("ContainerWidget", arguments: "容器");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}