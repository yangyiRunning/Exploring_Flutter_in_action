import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class FlexLayoutWidget extends StatelessWidget {
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
              //flex高度类似Android线性布局当中的layout_weight属性，按照比例分隔布局
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
                child: Text("---------------朴素的分割线------------------"),
              ),
              SizedBox(
                height: 200,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.green,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
